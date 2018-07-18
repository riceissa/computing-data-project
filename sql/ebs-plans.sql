insert into storage_plans(provider,name,region,date_observed,storage_cost,iops_cost,storage_type) values
    ('Amazon EBS','General Purpose SSD (gp2)','US East (N. Virginia)','2018-07-18','0.10',NULL,'SSD')
    ,('Amazon EBS','Provisioned IOPS SSD (io1)','US East (N. Virginia)','2018-07-18','0.125',0.065,'SSD')
    ,('Amazon EBS','Throughput Optimized HDD (st1)','US East (N. Virginia)','2018-07-18','0.045',NULL,'HDD')
    ,('Amazon EBS','Cold HDD (sc1)','US East (N. Virginia)','2018-07-18','0.025',NULL,'HDD')
    ,('Amazon EBS','Snapshots to Amazon S3','US East (N. Virginia)','2018-07-18','0.05',NULL,NULL)
;
