insert into cloud_instances(name, ram, cpu, ecu, processor, network_throughput, storage_type, cost, date_observed, region, operating_system) values
    ('t2.nano',0.5,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.0058,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.micro',1,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.0116,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.small',2,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.023,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.medium',4,2,NULL,'Intel Xeon family',NULL,'EBS Only',0.0464,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.large',8,2,NULL,'Intel Xeon family',NULL,'EBS Only',0.0928,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.xlarge',16,4,NULL,'Intel Xeon family',NULL,'EBS Only',0.1856,'2017-12-01','US East (N. Virginia)','Linux')
    ,('t2.2xlarge',32,8,NULL,'Intel Xeon family',NULL,'EBS Only',0.3712,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.large',8,2,10,NULL,NULL,'EBS Only',0.096,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.xlarge',16,4,15,NULL,NULL,'EBS Only',0.192,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.2xlarge',32,8,31,NULL,NULL,'EBS Only',0.384,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.4xlarge',64,16,61,NULL,NULL,'EBS Only',0.768,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.12xlarge',192,48,173,NULL,NULL,'EBS Only',2.304,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m5.24xlarge',384,96,345,NULL,NULL,'EBS Only',4.608,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.large',8,2,6.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.xlarge',16,4,13,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.2xlarge',32,8,26,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.4xlarge',64,16,53.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.8,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.10xlarge',160,40,124.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m4.16xlarge',256,64,188,'Intel Xeon E5-2686 v4',NULL,'EBS Only',3.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m3.medium',3.75,1,3,NULL,NULL,'1 x 4 SSD',0.067,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m3.large',7.5,2,6.5,NULL,NULL,'1 x 32 SSD',0.133,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m3.xlarge',15,4,13,NULL,NULL,'2 x 40 SSD',0.266,'2017-12-01','US East (N. Virginia)','Linux')
    ,('m3.2xlarge',30,8,26,NULL,NULL,'2 x 80 SSD',0.532,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.large',4,2,8,NULL,NULL,'EBS Only',0.085,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.xlarge',8,4,16,NULL,NULL,'EBS Only',0.17,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.2xlarge',16,8,31,NULL,NULL,'EBS Only',0.34,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.4xlarge',32,16,62,NULL,NULL,'EBS Only',0.68,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.9xlarge',72,36,139,NULL,NULL,'EBS Only',1.53,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c5.18xlarge',144,72,278,NULL,NULL,'EBS Only',3.06,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c4.large',3.75,2,8,NULL,NULL,'EBS Only',0.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c4.xlarge',7.5,4,16,NULL,NULL,'EBS Only',0.199,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c4.2xlarge',15,8,31,NULL,NULL,'EBS Only',0.398,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c4.4xlarge',30,16,62,NULL,NULL,'EBS Only',0.796,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c4.8xlarge',60,36,132,NULL,NULL,'EBS Only',1.591,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c3.large',3.75,2,7,NULL,NULL,'2 x 16 SSD',0.105,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c3.xlarge',7.5,4,14,NULL,NULL,'2 x 40 SSD',0.21,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c3.2xlarge',0.42,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c3.4xlarge',0.84,'2017-12-01','US East (N. Virginia)','Linux')
    ,('c3.8xlarge',1.68,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p2.xlarge',0.9,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p2.8xlarge',7.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p2.16xlarge',14.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p3.2xlarge',3.06,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p3.8xlarge',12.24,'2017-12-01','US East (N. Virginia)','Linux')
    ,('p3.16xlarge',24.48,'2017-12-01','US East (N. Virginia)','Linux')
    ,('g2.2xlarge',0.65,'2017-12-01','US East (N. Virginia)','Linux')
    ,('g2.8xlarge',2.6,'2017-12-01','US East (N. Virginia)','Linux')
    ,('g3.4xlarge',1.14,'2017-12-01','US East (N. Virginia)','Linux')
    ,('g3.8xlarge',2.28,'2017-12-01','US East (N. Virginia)','Linux')
    ,('g3.16xlarge',4.56,'2017-12-01','US East (N. Virginia)','Linux')
    ,('f1.2xlarge',1.65,'2017-12-01','US East (N. Virginia)','Linux')
    ,('f1.16xlarge',13.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1.16xlarge',6.669,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1.32xlarge',13.338,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.xlarge',0.834,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.2xlarge',1.668,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.4xlarge',3.336,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.8xlarge',6.672,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.16xlarge',13.344,'2017-12-01','US East (N. Virginia)','Linux')
    ,('x1e.32xlarge',26.688,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r3.large',0.166,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r3.xlarge',0.333,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r3.2xlarge',0.665,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r3.4xlarge',1.33,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r3.8xlarge',2.66,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.large',0.133,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.xlarge',0.266,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.2xlarge',0.532,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.4xlarge',1.064,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.8xlarge',2.128,'2017-12-01','US East (N. Virginia)','Linux')
    ,('r4.16xlarge',4.256,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.large',0.156,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.xlarge',0.312,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.2xlarge',0.624,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.4xlarge',1.248,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.8xlarge',2.496,'2017-12-01','US East (N. Virginia)','Linux')
    ,('i3.16xlarge',4.992,'2017-12-01','US East (N. Virginia)','Linux')
    ,('h1.2xlarge',0.55,'2017-12-01','US East (N. Virginia)','Linux')
    ,('h1.4xlarge',1.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('h1.8xlarge',2.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('h1.16xlarge',4.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('d2.xlarge',0.69,'2017-12-01','US East (N. Virginia)','Linux')
    ,('d2.2xlarge',1.38,'2017-12-01','US East (N. Virginia)','Linux')
    ,('d2.4xlarge',2.76,'2017-12-01','US East (N. Virginia)','Linux')
    ,('d2.8xlarge',5.52,'2017-12-01','US East (N. Virginia)','Linux')
;
