# Data from http://archive.today/2018.08.27-213433/https://aws.amazon.com/lightsail/pricing/ and https://aws.amazon.com/blogs/aws/amazon-lightsail-update-more-instance-sizes-and-price-reductions/ and https://web.archive.org/web/20180724215301/https://aws.amazon.com/lightsail/pricing/
insert into cloud_instances(provider, operating_system, date_observed, cost, ram, cpu, storage_type, storage_size) values
    ('Amazon Lightsail', 'Linux', '2018-07-24', 0.006845, 0.5, 1, 'SSD', 20)
    ,('Amazon Lightsail', 'Linux', '2018-07-24', 0.013689, 1, 1, 'SSD', 30)
    ,('Amazon Lightsail', 'Linux', '2018-07-24', 0.027379, 2, 1, 'SSD', 40)
    ,('Amazon Lightsail', 'Linux', '2018-07-24', 0.054757, 4, 2, 'SSD', 60)
    ,('Amazon Lightsail', 'Linux', '2018-07-24', 0.109514, 8, 2, 'SSD', 80)

    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.004791, 0.5, 1, 'SSD', 20)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.006845, 1, 1, 'SSD', 40)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.013689, 2, 1, 'SSD', 60)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.027379, 4, 2, 'SSD', 80)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.054757, 8, 2, 'SSD', 160)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.109514, 16, 4, 'SSD', 320)
    ,('Amazon Lightsail', 'Linux', '2018-08-27', 0.219028, 32, 8, 'SSD', 640)
;

# Data from http://archive.today/2019.06.19-021124/https://aws.amazon.com/lightsail/pricing/
# Price given in dollars per month. We assume 365.25 / 12 * 24 = 730.5 hours per month.
insert into cloud_instances(provider, operating_system, date_observed, cost, ram, cpu, storage_type, storage_size) values
    ('Amazon Lightsail', 'Linux', '2019-06-18', 0.004791, 0.5, 1, 'SSD', 20)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.006845, 1, 1, 'SSD', 40)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.013689, 2, 1, 'SSD', 60)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.027379, 4, 2, 'SSD', 80)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.054757, 8, 2, 'SSD', 160)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.109514, 16, 4, 'SSD', 320)
    ,('Amazon Lightsail', 'Linux', '2019-06-18', 0.219028, 32, 8, 'SSD', 640)
;
