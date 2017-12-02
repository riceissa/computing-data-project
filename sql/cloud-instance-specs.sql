create table cloud_instance_specs (
    cloud_instance_spec_id int(11) not null auto_increment primary key,
    name varchar(100) not null,

    # Measured in "GB", which could be gigabytes or gibibytes. Some pricing
    # pages don't make it clear which one is being used.
    ram float(6,2),

    # vCPU
    cpu float(6,2),

    ecu float(6,2),
    processor varchar(100),
    network_throughput float(6,2),
    storage varchar(100),
    unique key name(`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into cloud_instance_specs(name,ram,cpu,ecu,processor,network_throughput,storage) values
    ('t2.nano',0.5,1,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.micro',1,1,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.small',2,1,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.medium',4,2,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.large',8,2,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.xlarge',16,4,NULL,'Intel Xeon family',,'EBS Only')
    ,('t2.2xlarge',32,8,NULL,'Intel Xeon family',,'EBS Only')
    ,('m4.large',8,2,6.5,'Intel Xeon E5-2676 v3',,'EBS Only')
    ,('m4.xlarge',16,4,13,'Intel Xeon E5-2676 v3',,'EBS Only')
    ,('m4.2xlarge',32,8,26,'Intel Xeon E5-2676 v3',,'EBS Only')
    ,('m4.4xlarge',64,16,53.5,'Intel Xeon E5-2676 v3',,'EBS Only')
    ,('m4.10xlarge',160,40,124.5,'Intel Xeon E5-2676 v3',,'EBS Only')
    ,('m4.16xlarge',256,64,188,'Intel Xeon E5-2686 v4',,'EBS Only')
    ,('c4.large',3.75,2,8,NULL,,'EBS Only')
    ,('c4.xlarge',7.5,4,16,NULL,,'EBS Only')
    ,('c4.2xlarge',15,8,31,NULL,,'EBS Only')
    ,('c4.4xlarge',30,16,62,NULL,,'EBS Only')
    ,('c4.8xlarge',60,36,132,NULL,,'EBS Only')
    ,('p2.xlarge',61,4,12,NULL,,'EBS Only')
    ,('p2.8xlarge',488,32,94,NULL,,'EBS Only')
    ,('p2.16xlarge',732,64,188,NULL,,'EBS Only')
    ,('g3.4xlarge',122,16,47,NULL,,'EBS Only')
    ,('g3.8xlarge',244,32,94,NULL,,'EBS Only')
    ,('g3.16xlarge',488,64,188,NULL,,'EBS Only')
    ,('x1.16xlarge',976,64,174.5,NULL,,'1 x 1920 SSD')
    ,('x1.32xlarge',1952,128,349,NULL,,'2 x 1920 SSD')
    ,('r3.large',15,2,6.5,NULL,,'1 x 32 SSD')
    ,('r3.xlarge',30.5,4,13,NULL,,'1 x 80 SSD')
    ,('r3.2xlarge',61,8,26,NULL,,'1 x 160 SSD')
    ,('r3.4xlarge',122,16,52,NULL,,'1 x 320 SSD')
    ,('r3.8xlarge',244,32,104,NULL,,'2 x 320 SSD')
    ,('r4.large',15.25,2,7,NULL,,'EBS Only')
    ,('r4.xlarge',30.5,4,13.5,NULL,,'EBS Only')
    ,('r4.2xlarge',61,8,27,NULL,,'EBS Only')
    ,('r4.4xlarge',122,16,53,NULL,,'EBS Only')
    ,('r4.8xlarge',244,32,99,NULL,,'EBS Only')
    ,('r4.16xlarge',488,64,195,NULL,,'EBS Only')
    ,('i3.large',15.25,2,7,NULL,,'1 x 475 NVMe SSD')
    ,('i3.xlarge',30.5,4,13,NULL,,'1 x 950 NVMe SSD')
    ,('i3.2xlarge',61,8,27,NULL,,'1 x 1900 NVMe SSD')
    ,('i3.4xlarge',122,16,53,NULL,,'2 x 1900 NVMe SSD')
    ,('i3.8xlarge',244,32,99,NULL,,'4 x 1900 NVMe SSD')
    ,('i3.16xlarge',488,64,200,NULL,,'8 x 1900 NVMe SSD')
    ,('h1.2xlarge',32,8,26,NULL,,'1 x 2000 HDD')
    ,('h1.4xlarge',64,16,53.5,NULL,,'2 x 2000 HDD')
    ,('h1.8xlarge',128,32,99,NULL,,'4 x 2000 HDD')
    ,('h1.16xlarge',256,64,188,NULL,,'8 x 2000 HDD')
    ,('d2.xlarge',30.5,4,14,NULL,,'3 x 2000 HDD')
    ,('d2.2xlarge',61,8,28,NULL,,'6 x 2000 HDD')
    ,('d2.4xlarge',122,16,56,NULL,,'12 x 2000 HDD')
    ,('d2.8xlarge',244,36,116,NULL,,'24 x 2000 HDD')
;
