#!/usr/bin/env python3

import json
import sys
import pandas as pd
import mysql.connector
import datetime

import matplotlib.pyplot as plt

import pdb


def mysql_quote(x):
    """Quote the string x using MySQL quoting rules. If x is the empty string,
    return "NULL". Probably not safe against maliciously formed strings, but
    our input is fixed and from a basically trustable source."""
    if not x:
        return "NULL"
    x = x.replace("\\", "\\\\")
    x = x.replace("'", "''")
    x = x.replace("\n", "\\n")
    return "'{}'".format(x)


if len(sys.argv) < 2:
    print("Please specify JSON file as first argument", file=sys.stderr)
    quit()

with open(sys.argv[1], "r") as f:
    j = json.load(f)
    df = pd.DataFrame(j["SpotPriceHistory"])

    # We are getting data from a JSON where everything is a string, so convert
    # to the appropriate types
    df['SpotPrice'] = df['SpotPrice'].apply(pd.to_numeric)
    df['Timestamp'] = pd.to_datetime(df['Timestamp'])

    linux = df[df.ProductDescription == 'Linux/UNIX']

    linux.groupby('InstanceType').SpotPrice.mean().to_csv("naive.csv")

    resampled_data = []
    asfreq_data = []

    for key, group in linux.groupby(['InstanceType', 'AvailabilityZone']):
        instance_type, az = key
        resampled = group.set_index('Timestamp').sort_index().SpotPrice.resample('D').mean()
        # The .mean() after resampling was for the sample value to take a mean
        # value; now we're taking the mean of all the timestamps
        resampled_data.append((instance_type, az, resampled.mean()))

        asfreq = group.set_index('Timestamp').sort_index().SpotPrice.asfreq('D')
        asfreq_data.append((instance_type, az, asfreq.mean()))

        # if instance_type == 'c1.xlarge':
        #     group.set_index('Timestamp').sort_index().SpotPrice.plot(label=az)

    # plt.legend(loc='upper left')
    # plt.show()

    df = pd.DataFrame(resampled_data, columns=['InstanceType', 'AvailabilityZone', 'SpotPrice'])
    df.groupby('InstanceType').SpotPrice.mean().to_csv("resampled.csv")
    df.groupby('InstanceType').SpotPrice.min().to_csv("resampled_min.csv")
    first = True
    cnx = mysql.connector.connect(user='issa', database='computingdata')
    cursor = cnx.cursor()
    for instance_type, cost in df.groupby('InstanceType').SpotPrice.min().to_dict().items():
        column_vals = {}
        for column in ["provider", "name", "ram", "cpu", "ecu", "processor",
                       "network_throughput", "storage_type",
                       "region", "operating_system"]:
            cursor.execute(f"""select distinct({column}) from cloud_instances
                               where name = %s""", (instance_type,))
            result = cursor.fetchall()
            assert len(result) <= 1, (instance_type, column, result)
            if len(result) == 0:
                # e.g. for c5.18xlarge; this happens when we haven't inserted
                # data for on-demand for this instance type, so skip inserting
                # for now
                break
            if isinstance(result[0][0], float):
                column_vals[column] = str(result[0][0])
            else:
                column_vals[column] = mysql_quote(result[0][0])

        if len(column_vals) == 10:
            print(("    " if first else "    ,") + "(" + ",".join([
                column_vals["provider"],
                column_vals["name"],
                column_vals["ram"],
                column_vals["cpu"],
                column_vals["ecu"],
                column_vals["processor"],
                column_vals["network_throughput"],
                column_vals["storage_type"],
                str(cost),
                mysql_quote("2018-07-21"),  # TODO change this
                column_vals["region"],
                column_vals["operating_system"],
            ]) + ")")
            first = False

    pd.DataFrame(asfreq_data, columns=['InstanceType', 'AvailabilityZone', 'SpotPrice']).groupby('InstanceType').SpotPrice.mean().to_csv("asfreq.csv")
