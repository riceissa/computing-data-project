# Data from http://archive.today/2018.07.06-175634/https://www.linode.com/pricing
insert into cloud_instances(provider,date_observed,name,ram,cpu,storage_type,storage_size,cost) values
    # Standard plans
    ('Linode','2018-07-06','Nanode 1GB',1,1,'SSD',25,0.0075)
    ,('Linode','2018-07-06','Linode 2GB',2,1,'SSD',50,0.015)
    ,('Linode','2018-07-06','Linode 4GB',4,2,'SSD',80,0.03)
    ,('Linode','2018-07-06','Linode 8GB',8,4,'SSD',160,0.06)
    ,('Linode','2018-07-06','Linode 16GB',16,6,'SSD',320,0.12)
    ,('Linode','2018-07-21','Linode 32GB',32,8,'SSD',640,0.24)
    ,('Linode','2018-07-21','Linode 64GB',64,16,'SSD',1280,0.48)
    ,('Linode','2018-07-21','Linode 96GB',96,20,'SSD',1920,0.72)
    ,('Linode','2018-07-21','Linode 128GB',128,24,'SSD',2560,0.96)
    ,('Linode','2018-07-21','Linode 192GB',192,32,'SSD',3840,1.44)

    # High memory plans
    ,('Linode','2018-07-06','Linode 24GB',24,1,'SSD',20,0.09)
    ,('Linode','2018-07-06','Linode 48GB',48,2,'SSD',40,0.18)
    ,('Linode','2018-07-06','Linode 90GB',90,4,'SSD',90,0.36)
    ,('Linode','2018-07-06','Linode 150GB',150,8,'SSD',200,0.72)
    ,('Linode','2018-07-06','Linode 300GB',300,16,'SSD',340,1.44)
;
