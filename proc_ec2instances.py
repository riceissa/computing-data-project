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


NULL = ""

# (name,ram,cpu,ecu,processor,network_throughput,storage)
INSTANCE_SPECS = [
    ('t2.nano',0.5,1,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.micro',1,1,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.small',2,1,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.medium',4,2,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.large',8,2,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.xlarge',16,4,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('t2.2xlarge',32,8,NULL,'Intel Xeon family',NULL,'EBS Only')
    ,('m5.large',8,2,10,NULL,NULL,'EBS Only')
    ,('m5.xlarge',16,4,15,NULL,NULL,'EBS Only')
    ,('m5.2xlarge',32,8,31,NULL,NULL,'EBS Only')
    ,('m5.4xlarge',64,16,61,NULL,NULL,'EBS Only')
    ,('m5.12xlarge',192,48,173,NULL,NULL,'EBS Only')
    ,('m5.24xlarge',384,96,345,NULL,NULL,'EBS Only')
    ,('m4.large',8,2,6.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only')
    ,('m4.xlarge',16,4,13,'Intel Xeon E5-2676 v3',NULL,'EBS Only')
    ,('m4.2xlarge',32,8,26,'Intel Xeon E5-2676 v3',NULL,'EBS Only')
    ,('m4.4xlarge',64,16,53.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only')
    ,('m4.10xlarge',160,40,124.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only')
    ,('m4.16xlarge',256,64,188,'Intel Xeon E5-2686 v4',NULL,'EBS Only')
    ,('m3.medium',3.75,1,3,NULL,NULL,'1 x 4 SSD')
    ,('m3.large',7.5,2,6.5,NULL,NULL,'1 x 32 SSD')
    ,('m3.xlarge',15,4,13,NULL,NULL,'2 x 40 SSD')
    ,('m3.2xlarge',30,8,26,NULL,NULL,'2 x 80 SSD')
    ,('c5.large',4,2,8,NULL,NULL,'EBS Only')
    ,('c5.xlarge',8,4,16,NULL,NULL,'EBS Only')
    ,('c5.2xlarge',16,8,31,NULL,NULL,'EBS Only')
    ,('c5.4xlarge',32,16,62,NULL,NULL,'EBS Only')
    ,('c5.9xlarge',72,36,139,NULL,NULL,'EBS Only')
    ,('c5.18xlarge',144,72,278,NULL,NULL,'EBS Only')
    ,('c4.large',3.75,2,8,NULL,NULL,'EBS Only')
    ,('c4.xlarge',7.5,4,16,NULL,NULL,'EBS Only')
    ,('c4.2xlarge',15,8,31,NULL,NULL,'EBS Only')
    ,('c4.4xlarge',30,16,62,NULL,NULL,'EBS Only')
    ,('c4.8xlarge',60,36,132,NULL,NULL,'EBS Only')
    ,('c3.large',3.75,2,7,NULL,NULL,'2 x 16 SSD')
    ,('c3.xlarge',7.5,4,14,NULL,NULL,'2 x 40 SSD')
    ,('c3.2xlarge',15,8,28,NULL,NULL,'2 x 80 SSD')
    ,('c3.4xlarge',30,16,55,NULL,NULL,'2 x 160 SSD')
    ,('c3.8xlarge',60,32,108,NULL,NULL,'2 x 320 SSD')
    ,('p2.xlarge',61,4,12,NULL,NULL,'EBS Only')
    ,('p2.8xlarge',488,32,94,NULL,NULL,'EBS Only')
    ,('p2.16xlarge',732,64,188,NULL,NULL,'EBS Only')
    ,('p3.2xlarge',61,8,23.5,NULL,NULL,'EBS Only')
    ,('p3.8xlarge',244,32,94,NULL,NULL,'EBS Only')
    ,('p3.16xlarge',488,64,188,NULL,NULL,'EBS Only')
    ,('g2.2xlarge',15,8,26,NULL,NULL,'60 SSD')
    ,('g2.8xlarge',60,32,104,NULL,NULL,'2 x 120 SSD')
    ,('g3.4xlarge',122,16,47,NULL,NULL,'EBS Only')
    ,('g3.8xlarge',244,32,94,NULL,NULL,'EBS Only')
    ,('g3.16xlarge',488,64,188,NULL,NULL,'EBS Only')
    ,('f1.2xlarge',122,8,26,NULL,NULL,'1 x 470 NVMe SSD')
    ,('f1.16xlarge',976,64,188,NULL,NULL,'4 x 940 NVMe SSD')
    ,('x1.16xlarge',976,64,174.5,NULL,NULL,'1 x 1920 SSD')
    ,('x1.32xlarge',1952,128,349,NULL,NULL,'2 x 1920 SSD')
    ,('x1e.xlarge',122,4,12,NULL,NULL,'1 x 120 SSD')
    ,('x1e.2xlarge',244,8,23,NULL,NULL,'1 x 240 SSD')
    ,('x1e.4xlarge',488,16,47,NULL,NULL,'1 x 480 SSD')
    ,('x1e.8xlarge',976,32,91,NULL,NULL,'1 x 960')
    ,('x1e.16xlarge',1952,64,179,NULL,NULL,'1 x 1920 SSD')
    ,('x1e.32xlarge',3904,128,340,NULL,NULL,'2 x 1920 SSD')
    ,('r3.large',15,2,6.5,NULL,NULL,'1 x 32 SSD')
    ,('r3.xlarge',30.5,4,13,NULL,NULL,'1 x 80 SSD')
    ,('r3.2xlarge',61,8,26,NULL,NULL,'1 x 160 SSD')
    ,('r3.4xlarge',122,16,52,NULL,NULL,'1 x 320 SSD')
    ,('r3.8xlarge',244,32,104,NULL,NULL,'2 x 320 SSD')
    ,('r4.large',15.25,2,7,NULL,NULL,'EBS Only')
    ,('r4.xlarge',30.5,4,13.5,NULL,NULL,'EBS Only')
    ,('r4.2xlarge',61,8,27,NULL,NULL,'EBS Only')
    ,('r4.4xlarge',122,16,53,NULL,NULL,'EBS Only')
    ,('r4.8xlarge',244,32,99,NULL,NULL,'EBS Only')
    ,('r4.16xlarge',488,64,195,NULL,NULL,'EBS Only')
    ,('i3.large',15.25,2,7,NULL,NULL,'1 x 475 NVMe SSD')
    ,('i3.xlarge',30.5,4,13,NULL,NULL,'1 x 950 NVMe SSD')
    ,('i3.2xlarge',61,8,27,NULL,NULL,'1 x 1900 NVMe SSD')
    ,('i3.4xlarge',122,16,53,NULL,NULL,'2 x 1900 NVMe SSD')
    ,('i3.8xlarge',244,32,99,NULL,NULL,'4 x 1900 NVMe SSD')
    ,('i3.16xlarge',488,64,200,NULL,NULL,'8 x 1900 NVMe SSD')
    ,('h1.2xlarge',32,8,26,NULL,NULL,'1 x 2000 HDD')
    ,('h1.4xlarge',64,16,53.5,NULL,NULL,'2 x 2000 HDD')
    ,('h1.8xlarge',128,32,99,NULL,NULL,'4 x 2000 HDD')
    ,('h1.16xlarge',256,64,188,NULL,NULL,'8 x 2000 HDD')
    ,('d2.xlarge',30.5,4,14,NULL,NULL,'3 x 2000 HDD')
    ,('d2.2xlarge',61,8,28,NULL,NULL,'6 x 2000 HDD')
    ,('d2.4xlarge',122,16,56,NULL,NULL,'12 x 2000 HDD')
    ,('d2.8xlarge',244,36,116,NULL,NULL,'24 x 2000 HDD')
]

INSTANCE_MAP = {}

for instance in INSTANCE_SPECS:
    name, ram, cpu, ecu, processor, network_throughput, storage = instance
    INSTANCE_MAP[name] = {
            "ram": ram,
            "cpu": cpu,
            "ecu": ecu,
            "processor": processor,
            "network_throughput": network_throughput,
            "storage": storage,
            }


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

    print("""insert into cloud_instances(service,name,ram,cpu,ecu,processor,network_throughput,storage_type,cost,date_observed,region,operating_system) values""")

    table = soup.find("table")
    first = True
    for tr in table.find_all("tr"):
        apiname = tr.find("td", {"class": "apiname"})
        if not apiname and tr.find("td"):
            # There is at least one "td", so we are in a non-header
            # row
            apiname = tr.find_all("td")[7]
            # For the very first two earliest commits, it's the
            # position 6 that has the instance API name. Position
            # 7 has the cost info, so if we get a cost-looking
            # thing, we had better get the other column.
            if "$" in apiname.text:
                apiname = tr.find_all("td")[6]

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
                specs = INSTANCE_MAP[apiname.text.strip()]
                print("    " + ("" if first else ",") + ",".join([
                    mysql_quote("Amazon EC2"),  # service
                    mysql_quote(apiname.text.strip()),  # name
                    mysql_quote(specs["ram"]),  # ram
                    mysql_quote(specs["cpu"]),  # cpu
                    mysql_quote(specs["ecu"]),  # ecu
                    mysql_quote(specs["processor"]),  # processor
                    mysql_quote(specs["network_throughput"]),  # network_throughput
                    mysql_quote(specs["storage"]),  # storage_type
                    mysql_quote(cost),  # cost
                    mysql_quote(last_update),  # date_observed
                    mysql_quote(region),  # region
                    mysql_quote('Linux'),  # operating_system
                ])
                first = False

    print(";\n")

if __name__ == "__main__":
    main()
