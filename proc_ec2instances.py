#!/usr/bin/env python3

# This script processes the www/index.html file of
# https://github.com/powdahound/ec2instances.info
#
# The idea is, we check out an appropriate version of the index.html
# file, then run this script on it to extract the price info we want.

from bs4 import BeautifulSoup
import re


def main():
    print("""insert into cloud_instance_costs(name, cost, odate, region, operating_system) values""")


    # The default region seems to be Virginia and that's what we want
    # anyway, so just hard-code that
    region = "US East (N. Virginia)"

    with open("../ec2instances.info/www/index.html", "r") as f:
        soup = BeautifulSoup(f, "lxml")

    lu = soup.body.find_all(text=re.compile(r'Last [Uu]pdate:.*$'))
    m = re.match('Last [Uu]pdate: (\d\d\d\d-\d\d-\d\d) .*$', lu[0])
    last_update = m.group(1)

    table = soup.find("table")
    first = True
    for tr in table.find_all("tr"):
        apiname = tr.find("td", {"class": "apiname"})
        cost = tr.find("td", {"class": "cost-ondemand-linux"})
        if apiname and cost:
            pass
            # print(apiname.text.strip(), cost.text.strip())
            print("    " + ("" if first else ",") +
                  """('{}',{},'{}','{}','{},)""".format(
                      apiname.text.strip(),
                      cost.text.strip(),
                      last_update,
                      region,
                      'Linux'
                  ))
            first = False

if __name__ == "__main__":
    main()
