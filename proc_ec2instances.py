#!/usr/bin/env python3

# This script processes the www/index.html file of
# https://github.com/powdahound/ec2instances.info
#
# The idea is, we check out an appropriate version of the index.html
# file, then run this script on it to extract the price info we want.
#
# Run this script from the ec2instances.info repo, not the
# computing-data-project repo. For example you can do:
#     cd ec2instances.info
#     ../computing-data-project/proc_ec2instances.py > ../computing-data-project/sql/ec2-prices.sql

import sys
from bs4 import BeautifulSoup
import re
import subprocess


# These are chosen to be about 3 months apart, starting in September
# 2017, which itself is 3 months prior to December 2017 (when this
# project began)
commits = [
    "73514c58396c8e62944cd03380de387f69f29ca1",
    "61ce503ddb12ec38c752e2830e4b51e7714c2a91",
    "ecf40cd41fdf71679ecc20fbc142afccaeafdc2d",
    "b873303f45060e6003a2a67fda2b93cbd815d48d",
    "50db1b426f24b296907d7b272260ba78ba7fe946",
    "2a76f472c30d1481b3367122599fd54365555e44",
    "bc0d2a7ecab0a8e8bb363749ed8eeca320c1b0d2",
    "8c7f9869bb3cca22536a030adc826decfb147112",
    "0c88a0b8d173dcff39d6434ead2f6aeda9b9aaff",
    "a97b56487bc54bc7d7c260e6abe5bf2d0be4e874",
    "438726541846d7fe4bd90d0857eee196f9a7a03b",
    "c388e1e9e7bca568bf9da08ea0d3a63c8f627495",
    "e02c7ba0dde0c7ab21dd21a3c0d4313e0b93450b",
    "77bff1e5765c10658e749757ed61381fad6ccc67",
    "ea75e42e74edde59f5ecf6fe92921a92889fc45b",
    "5e23ecfaf253d46e3379476100db4d7d886e0787",
    "6c63842d4821b885c95ff6a2219cd12c8e2e4b42",
    "63cf78ce2d251d52d23e0b2c7a118110b7a91497",
    "d6ef73ce9cf5ecb2ee0dc9f44d6df1c3bcdc8dd3",
    "9df4ae52538c541be57b3f56beb3e4988213220c",
    "c7faa70b7da12af21bc2b8b688236c0b49c79288",
    "ef7cbbf2a06da7f2296da1e18ceff8441548ee49",
    "3a61bbd527963fe9f692c3f4c4e72a6256fb78e0",
]


def main():
    for commit in commits:
        subprocess.run(["git", "checkout", commit])
        print_sql(commit)


def print_sql(commit):
    """Print the SQL insert lines for the given commit hash."""

    # The default region seems to be Virginia and that's what we want
    # anyway, so just hard-code that
    region = "US East (N. Virginia)"

    with open("www/index.html", "r") as f:
        soup = BeautifulSoup(f, "lxml")

    # Try to get the last update date from the page. The format of
    # this changed a couple of times, so we have to try a few
    # different ways.
    lu = soup.body.find_all(text=re.compile(r'Last [Uu]pdate:.*$'))
    m = None
    if lu:
        try:
            m = re.match('Last [Uu]pdate: (\d\d\d\d-\d\d-\d\d) .*$', lu[0])
        except:
            print(lu, file=sys.stderr)
    if not m:
        lu = soup.body.find_all(text=re.compile(r'.*This was last done at.*'))
        try:
            m = re.search('This was last done at (\d\d\d\d-\d\d-\d\d) .*$',
                          lu[0].strip())
        except:
            print(lu, file=sys.stderr)
    if not m:
        lu = soup.body.find_all(text=re.compile(r'.*Generated at:.*'))
        try:
            m = re.search('Generated at: (\d\d\d\d-\d\d-\d\d) .*$',
                          lu[0].strip())
        except:
            print(lu, file=sys.stderr)
    if not m:
        # Just get the date from the commit date
        m = re.search(r'(\d\d\d\d-\d\d-\d\d).*',
                      subprocess.check_output(["git", "log", "-1",
                                               "--format=%ai", "--date=local"])
                      .decode('utf8').strip())

    last_update = m.group(1)

    print("""# Prices from commit {}""".format(commit))

    print("""insert into cloud_instance_costs(name, cost, odate, region, operating_system) values""")

    table = soup.find("table")
    first = True
    for tr in table.find_all("tr"):
        apiname = tr.find("td", {"class": "apiname"})
        if not apiname:
            try:
                apiname = tr.find_all("td")[7]
                # For the very first two earliest commits, it's the
                # position 6 that has the instance API name. Position
                # 7 has the cost info, so if we get a cost-looking
                # thing, we had better get the other column.
                if "$" in apiname.text:
                    apiname = tr.find_all("td")[6]
            except:
                print(tr, file=sys.stderr)
        cost = (tr.find("td", {"class": "cost-ondemand-linux"}) or
                tr.find("td", {"class": "cost-linux"}) or
                tr.find("td", {"class": "cost"}))
        if apiname and cost:
            cost = cost.text.strip()
            if cost != "unavailable":
                if cost.startswith("$") and cost.endswith(" hourly"):
                    cost = cost[len("$"):-len(" hourly")]
                elif cost.startswith("$") and cost.endswith(" per hour"):
                    cost = cost[len("$"):-len(" per hour")]
                else:
                    raise ValueError("Cost is in a weird format we don't know about", cost)
                print("    " + ("" if first else ",") +
                      """('{}',{},'{}','{}','{}')""".format(
                          apiname.text.strip(),
                          cost,
                          last_update,
                          region,
                          'Linux'
                      ))
                first = False

    print(";\n")

if __name__ == "__main__":
    main()
