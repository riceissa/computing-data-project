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


from bs4 import BeautifulSoup
import re
import subprocess


# These are chosen to be about 3 months apart, starting in September
# 2017, which itself is 3 months prior to December 2017 (when this
# project began)
commits = [
    "73514c58396c8e62944cd03380de387f69f29ca1",
    "61ce503ddb12ec38c752e2830e4b51e7714c2a91",
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

    lu = soup.body.find_all(text=re.compile(r'Last [Uu]pdate:.*$'))
    m = re.match('Last [Uu]pdate: (\d\d\d\d-\d\d-\d\d) .*$', lu[0])
    last_update = m.group(1)

    print("""# Prices from commit {}""".format(commit))

    print("""insert into cloud_instance_costs(name, cost, odate, region, operating_system) values""")

    table = soup.find("table")
    first = True
    for tr in table.find_all("tr"):
        apiname = tr.find("td", {"class": "apiname"})
        cost = tr.find("td", {"class": "cost-ondemand-linux"})
        if apiname and cost:
            cost = cost.text.strip()
            assert cost.startswith("$") and cost.endswith(" hourly")
            cost = cost[len("$"):-len(" hourly")]
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
