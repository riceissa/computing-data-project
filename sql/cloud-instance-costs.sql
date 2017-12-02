create table cloud_instance_costs (
    cloud_instance_cost_id int(11) not null auto_increment primary key,
    name varchar(100) not null,

    # Cost per hour
    cost float(7,5),

    odate date,
    region varchar(100),
    operating_system varchar(100),
    unique key name(`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into cloud_instance_costs(name, cost, odate, region, operating_system) values
    ('t2.nano',0.0058,'2017-12-01','US East (Ohio)','Linux')
    ,('t2.micro',0.0116,'2017-12-01','US East (Ohio)','Linux')
    ,('t2.small',0.023,'2017-12-01','US East (Ohio)','Linux')
    ,('t2.medium',0.0464,'2017-12-01','US East (Ohio)','Linux')
    ,('t2.large',0.0928,'2017-12-01','US East (Ohio)','Linux')
    ,('t2.2xlarge',0.3712,'2017-12-01','US East (Ohio)','Linux')
    ,('m4.large',0.1,'2017-12-01','US East (Ohio)','Linux')
    ,('m4.xlarge',0.2,'2017-12-01','US East (Ohio)','Linux')
    ,('m4.10xlarge',2,'2017-12-01','US East (Ohio)','Linux')
    ,('m4.16xlarge',3.2,'2017-12-01','US East (Ohio)','Linux')
    ,('c4.large',0.1,'2017-12-01','US East (Ohio)','Linux')
    ,('c4.xlarge',0.199,'2017-12-01','US East (Ohio)','Linux')
    ,('c4.2xlarge',0.398,'2017-12-01','US East (Ohio)','Linux')
    ,('c4.4xlarge',0.796,'2017-12-01','US East (Ohio)','Linux')
    ,('c4.8xlarge',1.591,'2017-12-01','US East (Ohio)','Linux')
    ,('p2.xlarge',0.9,'2017-12-01','US East (Ohio)','Linux')
    ,('p2.8xlarge',7.2,'2017-12-01','US East (Ohio)','Linux')
    ,('p2.16xlarge',14.4,'2017-12-01','US East (Ohio)','Linux')
    ,('g3.4xlarge',1.14,'2017-12-01','US East (Ohio)','Linux')
    ,('g3.8xlarge',2.28,'2017-12-01','US East (Ohio)','Linux')
    ,('g3.16xlarge',4.56,'2017-12-01','US East (Ohio)','Linux')
    ,('x1.16xlarge',6.669,'2017-12-01','US East (Ohio)','Linux')
    ,('x1.32xlarge',13.338,'2017-12-01','US East (Ohio)','Linux')
    ,('r3.large',0.166,'2017-12-01','US East (Ohio)','Linux')
    ,('r3.xlarge',0.333,'2017-12-01','US East (Ohio)','Linux')
    ,('r3.2xlarge',0.665,'2017-12-01','US East (Ohio)','Linux')
    ,('r3.4xlarge',1.33,'2017-12-01','US East (Ohio)','Linux')
    ,('r3.8xlarge',2.66,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.large',0.133,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.xlarge',0.266,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.2xlarge',0.532,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.4xlarge',1.064,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.8xlarge',2.128,'2017-12-01','US East (Ohio)','Linux')
    ,('r4.16xlarge',4.256,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.large',0.156,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.xlarge',0.312,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.2xlarge',0.624,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.4xlarge',1.248,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.8xlarge',2.496,'2017-12-01','US East (Ohio)','Linux')
    ,('i3.16xlarge',4.992,'2017-12-01','US East (Ohio)','Linux')
    ,('h1.2xlarge',0.55,'2017-12-01','US East (Ohio)','Linux')
    ,('h1.4xlarge',1.1,'2017-12-01','US East (Ohio)','Linux')
    ,('h1.8xlarge',2.2,'2017-12-01','US East (Ohio)','Linux')
    ,('h1.16xlarge',4.4,'2017-12-01','US East (Ohio)','Linux')
    ,('d2.xlarge',0.69,'2017-12-01','US East (Ohio)','Linux')
    ,('d2.2xlarge',1.38,'2017-12-01','US East (Ohio)','Linux')
    ,('d2.4xlarge',2.76,'2017-12-01','US East (Ohio)','Linux')
    ,('d2.8xlarge',5.52,'2017-12-01','US East (Ohio)','Linux')
;
