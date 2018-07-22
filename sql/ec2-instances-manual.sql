insert into cloud_instances(provider, name, ram, cpu, ecu, processor, network_throughput, storage_type, cost, date_observed, region, operating_system) values
    ('Amazon EC2','t2.nano',0.5,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.0058,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.micro',1,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.0116,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.small',2,1,NULL,'Intel Xeon family',NULL,'EBS Only',0.023,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.medium',4,2,NULL,'Intel Xeon family',NULL,'EBS Only',0.0464,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.large',8,2,NULL,'Intel Xeon family',NULL,'EBS Only',0.0928,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.xlarge',16,4,NULL,'Intel Xeon family',NULL,'EBS Only',0.1856,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','t2.2xlarge',32,8,NULL,'Intel Xeon family',NULL,'EBS Only',0.3712,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.large',8,2,10,NULL,NULL,'EBS Only',0.096,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.xlarge',16,4,15,NULL,NULL,'EBS Only',0.192,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.2xlarge',32,8,31,NULL,NULL,'EBS Only',0.384,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.4xlarge',64,16,61,NULL,NULL,'EBS Only',0.768,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.12xlarge',192,48,173,NULL,NULL,'EBS Only',2.304,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m5.24xlarge',384,96,345,NULL,NULL,'EBS Only',4.608,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.large',8,2,6.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.xlarge',16,4,13,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.2xlarge',32,8,26,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.4xlarge',64,16,53.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',0.8,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.10xlarge',160,40,124.5,'Intel Xeon E5-2676 v3',NULL,'EBS Only',2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m4.16xlarge',256,64,188,'Intel Xeon E5-2686 v4',NULL,'EBS Only',3.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m3.medium',3.75,1,3,NULL,NULL,'1 x 4 SSD',0.067,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m3.large',7.5,2,6.5,NULL,NULL,'1 x 32 SSD',0.133,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m3.xlarge',15,4,13,NULL,NULL,'2 x 40 SSD',0.266,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','m3.2xlarge',30,8,26,NULL,NULL,'2 x 80 SSD',0.532,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.large',4,2,8,NULL,NULL,'EBS Only',0.085,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.xlarge',8,4,16,NULL,NULL,'EBS Only',0.17,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.2xlarge',16,8,31,NULL,NULL,'EBS Only',0.34,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.4xlarge',32,16,62,NULL,NULL,'EBS Only',0.68,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.9xlarge',72,36,139,NULL,NULL,'EBS Only',1.53,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c5.18xlarge',144,72,278,NULL,NULL,'EBS Only',3.06,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c4.large',3.75,2,8,NULL,NULL,'EBS Only',0.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c4.xlarge',7.5,4,16,NULL,NULL,'EBS Only',0.199,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c4.2xlarge',15,8,31,NULL,NULL,'EBS Only',0.398,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c4.4xlarge',30,16,62,NULL,NULL,'EBS Only',0.796,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c4.8xlarge',60,36,132,NULL,NULL,'EBS Only',1.591,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c3.large',3.75,2,7,NULL,NULL,'2 x 16 SSD',0.105,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c3.xlarge',7.5,4,14,NULL,NULL,'2 x 40 SSD',0.21,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c3.2xlarge',15,8,28,NULL,NULL,'2 x 80 SSD',0.42,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c3.4xlarge',30,16,55,NULL,NULL,'2 x 160 SSD',0.84,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','c3.8xlarge',60,32,108,NULL,NULL,'2 x 320 SSD',1.68,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p2.xlarge',61,4,12,NULL,NULL,'EBS Only',0.9,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p2.8xlarge',488,32,94,NULL,NULL,'EBS Only',7.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p2.16xlarge',732,64,188,NULL,NULL,'EBS Only',14.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p3.2xlarge',61,8,23.5,NULL,NULL,'EBS Only',3.06,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p3.8xlarge',244,32,94,NULL,NULL,'EBS Only',12.24,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','p3.16xlarge',488,64,188,NULL,NULL,'EBS Only',24.48,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','g2.2xlarge',15,8,26,NULL,NULL,'60 SSD',0.65,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','g2.8xlarge',60,32,104,NULL,NULL,'2 x 120 SSD',2.6,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','g3.4xlarge',122,16,47,NULL,NULL,'EBS Only',1.14,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','g3.8xlarge',244,32,94,NULL,NULL,'EBS Only',2.28,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','g3.16xlarge',488,64,188,NULL,NULL,'EBS Only',4.56,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','f1.2xlarge',122,8,26,NULL,NULL,'1 x 470 NVMe SSD',1.65,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','f1.16xlarge',976,64,188,NULL,NULL,'4 x 940 NVMe SSD',13.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1.16xlarge',976,64,174.5,NULL,NULL,'1 x 1920 SSD',6.669,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1.32xlarge',1952,128,349,NULL,NULL,'2 x 1920 SSD',13.338,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.xlarge',122,4,12,NULL,NULL,'1 x 120 SSD',0.834,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.2xlarge',244,8,23,NULL,NULL,'1 x 240 SSD',1.668,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.4xlarge',488,16,47,NULL,NULL,'1 x 480 SSD',3.336,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.8xlarge',976,32,91,NULL,NULL,'1 x 960',6.672,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.16xlarge',1952,64,179,NULL,NULL,'1 x 1920 SSD',13.344,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','x1e.32xlarge',3904,128,340,NULL,NULL,'2 x 1920 SSD',26.688,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r3.large',15,2,6.5,NULL,NULL,'1 x 32 SSD',0.166,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r3.xlarge',30.5,4,13,NULL,NULL,'1 x 80 SSD',0.333,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r3.2xlarge',61,8,26,NULL,NULL,'1 x 160 SSD',0.665,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r3.4xlarge',122,16,52,NULL,NULL,'1 x 320 SSD',1.33,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r3.8xlarge',244,32,104,NULL,NULL,'2 x 320 SSD',2.66,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.large',15.25,2,7,NULL,NULL,'EBS Only',0.133,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.xlarge',30.5,4,13.5,NULL,NULL,'EBS Only',0.266,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.2xlarge',61,8,27,NULL,NULL,'EBS Only',0.532,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.4xlarge',122,16,53,NULL,NULL,'EBS Only',1.064,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.8xlarge',244,32,99,NULL,NULL,'EBS Only',2.128,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','r4.16xlarge',488,64,195,NULL,NULL,'EBS Only',4.256,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.large',15.25,2,7,NULL,NULL,'1 x 475 NVMe SSD',0.156,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.xlarge',30.5,4,13,NULL,NULL,'1 x 950 NVMe SSD',0.312,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.2xlarge',61,8,27,NULL,NULL,'1 x 1900 NVMe SSD',0.624,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.4xlarge',122,16,53,NULL,NULL,'2 x 1900 NVMe SSD',1.248,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.8xlarge',244,32,99,NULL,NULL,'4 x 1900 NVMe SSD',2.496,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','i3.16xlarge',488,64,200,NULL,NULL,'8 x 1900 NVMe SSD',4.992,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','h1.2xlarge',32,8,26,NULL,NULL,'1 x 2000 HDD',0.55,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','h1.4xlarge',64,16,53.5,NULL,NULL,'2 x 2000 HDD',1.1,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','h1.8xlarge',128,32,99,NULL,NULL,'4 x 2000 HDD',2.2,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','h1.16xlarge',256,64,188,NULL,NULL,'8 x 2000 HDD',4.4,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','d2.xlarge',30.5,4,14,NULL,NULL,'3 x 2000 HDD',0.69,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','d2.2xlarge',61,8,28,NULL,NULL,'6 x 2000 HDD',1.38,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','d2.4xlarge',122,16,56,NULL,NULL,'12 x 2000 HDD',2.76,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2','d2.8xlarge',244,36,116,NULL,NULL,'24 x 2000 HDD',5.52,'2017-12-01','US East (N. Virginia)','Linux')
    ,('Amazon EC2', 'c5d.large', 4, 2, 9, NULL, NULL, '1 x 50 NVMe SSD', 0.096, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'c5d.xlarge', 8, 4, 17, NULL, NULL, '1 x 100 NVMe SSD', 0.192, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'c5d.2xlarge', 16, 8, 34, NULL, NULL, '1 x 200 NVMe SSD', 0.384, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'c5d.4xlarge', 32, 16, 68, NULL, NULL, '1 x 400 NVMe SSD', 0.768, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'c5d.9xlarge', 72, 36, 141, NULL, NULL, '1 x 900 NVMe SSD', 1.728, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'c5d.18xlarge', 144, 72, 281, NULL, NULL, '1 x 1800 NVMe SSD', 3.456, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'i3.metal', 512, 72, 208, NULL, NULL, '8 x 1900 NVMe SSD', 4.992, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.large', 8, 2, 8, NULL, NULL, '1 x 75 NVMe SSD', 0.113, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.xlarge', 16, 4, 16, NULL, NULL, '1 x 150 NVMe SSD', 0.226, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.2xlarge', 32, 8, 31, NULL, NULL, '1 x 300 NVMe SSD', 0.452, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.4xlarge', 64, 16, 60, NULL, NULL, '2 x 300 NVMe SSD', 0.904, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.12xlarge', 192, 48, 173, NULL, NULL, '2 x 900 NVMe SSD', 2.712, '2018-07-21', 'US East (N. Virginia)', 'Linux')
    ,('Amazon EC2', 'm5d.24xlarge', 384, 96, 345, NULL, NULL, '4 x 900 NVMe SSD', 5.424, '2018-07-21', 'US East (N. Virginia)', 'Linux')
;