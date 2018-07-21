#!/usr/bin/env python3

import json
import pandas as pd

import pdb

with open("aws-spot.json", "r") as f:
    j = json.load(f)
    df = pd.DataFrame(j["SpotPriceHistory"])

    # We are getting data from a JSON where everything is a string, so convert
    # to the appropriate types
    df['SpotPrice'] = df['SpotPrice'].apply(pd.to_numeric)
    df['Timestamp'] = pd.to_datetime(df['Timestamp'])

    linux = df[df.ProductDescription == 'Linux/UNIX']

    linux.groupby('InstanceType').SpotPrice.mean().to_csv("naive.csv")

    resampled_data = []

    for key, group in linux.groupby(['InstanceType', 'AvailabilityZone']):
        # TODO check what happens if we don't do resample.mean here, but rather
        # something like asfreq
        resampled = group.set_index('Timestamp')['SpotPrice'].resample('D').mean()
        # The first .mean() was for the sample value to take a mean value; now
        # we're taking the mean of all the timestamps
        avg = resampled.mean()
        resampled_data.append((key[0], key[1], avg))

    df = pd.DataFrame(resampled_data, columns=['InstanceType', 'AvailabilityZone', 'SpotPrice'])
    df.groupby('InstanceType').SpotPrice.mean().to_csv("resampled.csv")
