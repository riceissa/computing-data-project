insert into storage_plans(provider,name,date_observed,region,redundancy,disk_size,storage_cost,storage_type,iops,throughput) values
    ('Azure Managed Disks','Premium SSD Managed Disks P4','2018-07-18','East US','LRS',32,0.165,'SSD',120,25)
    ,('Azure Managed Disks','Premium SSD Managed Disks P6','2018-07-18','East US','LRS',64,0.159531,'SSD',240,50)
    ,('Azure Managed Disks','Premium SSD Managed Disks P10','2018-07-18','East US','LRS',128,0.153984,'SSD',500,100)
    ,('Azure Managed Disks','Premium SSD Managed Disks P15','2018-07-18','East US','LRS',256,0.148516,'SSD',1100,125)
    ,('Azure Managed Disks','Premium SSD Managed Disks P20','2018-07-18','East US','LRS',512,0.143008,'SSD',2300,150)
    ,('Azure Managed Disks','Premium SSD Managed Disks P30','2018-07-18','East US','LRS',1024,0.132002,'SSD',5000,200)
    ,('Azure Managed Disks','Premium SSD Managed Disks P40','2018-07-18','East US','LRS',2048,0.126489,'SSD',7500,250)
    ,('Azure Managed Disks','Premium SSD Managed Disks P50','2018-07-18','East US','LRS',4096,0.120989,'SSD',7500,250)
;

insert into storage_plans(provider,name,date_observed,region,redundancy,disk_size,storage_cost,storage_type,iops,throughput,write_op_cost,read_op_cost,list_op_cost,delete_op_cost) values
    ('Azure Managed Disks','Standard SSD Managed Disks E10','2018-07-18','East US','LRS',128,0.035,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard SSD Managed Disks E15','2018-07-18','East US','LRS',256,0.03375,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard SSD Managed Disks E20','2018-07-18','East US','LRS',512,0.0325,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard SSD Managed Disks E30','2018-07-18','East US','LRS',1024,0.03,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard SSD Managed Disks E40','2018-07-18','East US','LRS',2048,0.02875,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard SSD Managed Disks E50','2018-07-18','East US','LRS',4096,0.0275,'SSD',500,60,0.0001,'0.0001',0.0001,0.0001)
    ,('Azure Managed Disks','Standard HDD Managed Disks S4','2018-07-18','East US','LRS',32,0.048125,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S6','2018-07-18','East US','LRS',64,0.047031,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S10','2018-07-18','East US','LRS',128,0.046016,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S15','2018-07-18','East US','LRS',256,0.044258,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S20','2018-07-18','East US','LRS',512,0.0425,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S30','2018-07-18','East US','LRS',1024,0.04,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S40','2018-07-18','East US','LRS',2048,0.038003,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S50','2018-07-18','East US','LRS',4096,0.035,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
;

insert into storage_plans(provider,name,date_observed,region,redundancy,disk_size,storage_cost,storage_type,iops,throughput) values
    ('Azure Managed Disks','Premium SSD Managed Disks P4','2019-07-08','East US','LRS',32,0.165,'SSD',120,25)
    ,('Azure Managed Disks','Premium SSD Managed Disks P6','2019-07-08','East US','LRS',64,0.159531,'SSD',240,50)
    ,('Azure Managed Disks','Premium SSD Managed Disks P10','2019-07-08','East US','LRS',128,0.153984,'SSD',500,100)
    ,('Azure Managed Disks','Premium SSD Managed Disks P15','2019-07-08','East US','LRS',256,0.148516,'SSD',1100,125)
    ,('Azure Managed Disks','Premium SSD Managed Disks P20','2019-07-08','East US','LRS',512,0.143008,'SSD',2300,150)
    ,('Azure Managed Disks','Premium SSD Managed Disks P30','2019-07-08','East US','LRS',1024,0.132002,'SSD',5000,200)
    ,('Azure Managed Disks','Premium SSD Managed Disks P40','2019-07-08','East US','LRS',2048,0.126489,'SSD',7500,250)
    ,('Azure Managed Disks','Premium SSD Managed Disks P50','2019-07-08','East US','LRS',4096,0.120989,'SSD',7500,250)
    ,('Azure Managed Disks','Premium SSD Managed Disks P60','2019-07-08','East US','LRS',8192,0.115488,'SSD',16000,500)
    ,('Azure Managed Disks','Premium SSD Managed Disks P70','2019-07-08','East US','LRS',16384,0.109989,'SSD',18000,750)
    ,('Azure Managed Disks','Premium SSD Managed Disks P80','2019-07-08','East US','LRS',32767 /* 32*1024 = 32768 but the page says "32 TiB (32767 GiB)" */,0.109992,'SSD',20000,900)
;

insert into storage_plans(provider,name,date_observed,region,redundancy,disk_size,storage_cost,storage_type,iops,throughput,write_op_cost,read_op_cost,list_op_cost,delete_op_cost) values
    # "We charge $0.002 per 10,000 transaction units for Standard SSD Managed Disks. Any type of operation against the storage is counted as a transaction, including reads, writes and deletes" (https://azure.microsoft.com/en-us/pricing/details/managed-disks/) so that's $0.0002 per 1,000 operations.
    ('Azure Managed Disks','Standard SSD Managed Disks E4','2019-07-08','East US','LRS',32,0.075,'SSD',120,25,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E6','2019-07-08','East US','LRS',64,0.075,'SSD',240,50,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E10','2019-07-08','East US','LRS',128,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E15','2019-07-08','East US','LRS',256,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E20','2019-07-08','East US','LRS',512,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E30','2019-07-08','East US','LRS',1024,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E40','2019-07-08','East US','LRS',2048,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E50','2019-07-08','East US','LRS',4096,0.075,'SSD',500,60,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E60','2019-07-08','East US','LRS',8192,0.075,'SSD',2000,400,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E70','2019-07-08','East US','LRS',16384,0.075,'SSD',4000,600,0.0002,'0.0002',0.0002,0.0002)
    ,('Azure Managed Disks','Standard SSD Managed Disks E80','2019-07-08','East US','LRS',32767,0.075002,'SSD',6000,750,0.0002,'0.0002',0.0002,0.0002)
;

insert into storage_plans(provider,name,date_observed,region,redundancy,disk_size,storage_cost,storage_type,iops,throughput,write_op_cost,read_op_cost,list_op_cost,delete_op_cost) values
    # "We charge $0.0005 per 10,000 transactions for Standard HDD Managed Disks. Any type of operation against the storage is counted as a transaction, including reads, writes and deletes." (https://azure.microsoft.com/en-us/pricing/details/managed-disks/) so 0.00005 per 1,000.
    ('Azure Managed Disks','Standard HDD Managed Disks S4','2019-07-08','East US','LRS',32,0.048125,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S6','2019-07-08','East US','LRS',64,0.047031,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S10','2019-07-08','East US','LRS',128,0.046016,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S15','2019-07-08','East US','LRS',256,0.044258,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S20','2019-07-08','East US','LRS',512,0.0425,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S30','2019-07-08','East US','LRS',1024,0.04,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S40','2019-07-08','East US','LRS',2048,0.038003,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S50','2019-07-08','East US','LRS',4096,0.035,'HDD',500,60,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S60','2019-07-08','East US','LRS',8192,0.032,'HDD',1300,300,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S70','2019-07-08','East US','LRS',16384,0.03,'HDD',2000,500,0.00005,'0.00005',0.00005,0.00005)
    ,('Azure Managed Disks','Standard HDD Managed Disks S80','2019-07-08','East US','LRS',32767,0.029101,'HDD',2000,500,0.00005,'0.00005',0.00005,0.00005)
;
