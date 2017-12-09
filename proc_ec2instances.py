#!/usr/bin/env python3

# This script processes the www/index.html file of
# https://github.com/powdahound/ec2instances.info
#
# The idea is, we check out an appropriate version of the index.html
# file, then run this script on it to extract the price info we want.

from bs4 import BeautifulSoup
import re


def main():
    with open("../ec2instances.info/www/index.html", "r") as f:
        soup = BeautifulSoup(f, "lxml")

    update_date = soup.body.find_all(text=re.compile(r'Last [Uu]pdate:.*$'))
    m = re.match('Last [Uu]pdate: (\d\d\d\d-\d\d-\d\d) .*$', update_date[0])
    if m:
        print(m.group(1))

    table = soup.find("table")
    for tr in table.find_all("tr"):
        apiname = tr.find("td", {"class": "apiname"})
        cost = tr.find("td", {"class": "cost-ondemand-linux"})
        if apiname and cost:
            pass
            # print(apiname.text.strip(), cost.text.strip())

if __name__ == "__main__":
    main()
