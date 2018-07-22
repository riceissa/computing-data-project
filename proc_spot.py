#!/usr/bin/env python3

import json
import sys
import pandas as pd

import matplotlib.pyplot as plt

import pdb

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

    pd.DataFrame(asfreq_data, columns=['InstanceType', 'AvailabilityZone', 'SpotPrice']).groupby('InstanceType').SpotPrice.mean().to_csv("asfreq.csv")
