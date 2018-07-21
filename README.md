# Computing Data Project

## Setting up

First, set up the database:

```bash
git clone https://github.com/riceissa/computing-data-project.git
cd computing-data-project
mysql -e "create database computingdata"
make read  # read in data from sql directory
```

If MySQL needs credentials, one way to avoid entering the password each time is
to create a file named `my.cnf` with the following contents:

```
[client]
user=YOURNAME
password=SECRET
```

(Maybe change the permissions on the file.)

Now when you run a MySQL command, you can pass `--defaults-extra-file=my.cnf`.
For example:

```bash
make read MYSQL_ARGS="--defaults-extra-file=my.cnf"
```

Now set up the password file to allow PHP to log in to the database:

```bash
cp access-portal/backend/globalVariables/{dummyPasswordFile.inc,passwordFile.inc}
vi access-portal/backend/globalVariables/passwordFile.inc  # change to add database login info
```

If you're hosting this on a server, make sure to disable public access to the
password file.

Finally start the service:

```bash
cd access-portal
php -S localhost:8000
```

To get AnchorJS and tablesorter, run:

```bash
make fetch_anchorjs
make fetch_tablesorter
```

You can now visit `http://localhost:8000/` in your browser.

## Getting EC2 spot price history

Run the following:

```bash
aws ec2 describe-spot-price-history \
    --start-time "$(date -u -d '91 days ago' +'%Y-%m-%dT%H:%M:%S')" \
    --end-time "$(date -u -d 'tomorrow' +'%Y-%m-%dT%H:%M:%S')" \
    --region us-east-1 > aws-spot-"$(date -u -Idate)".json
```
