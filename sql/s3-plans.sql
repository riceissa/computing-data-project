insert into storage_plans(provider,name,date_observed,region,storage_cost,download_cost,write_op_cost,read_op_cost,list_op_cost,delete_op_cost,minimum_duration) values
    ('Amazon S3','S3 Standard Storage','2018-07-15','US East (N. Virginia)','[[50, 0.023], [500, 0.022], [null, 0.021]]','0',0.005,'0.0004',0.005,0,0)
    ,('Amazon S3','S3 Standard-Infrequent Access','2018-07-15','US East (N. Virginia)','0.0125','0.01',0.01,'0.001',0.001,0,1)
    ,('Amazon S3','S3 One Zone-Infrequent Access','2018-07-15','US East (N. Virginia)','0.01','0.01',0.01,'0.001',0.001,0,1)
    ,('Amazon S3','Amazon Glacier Storage','2018-07-15','US East (N. Virginia)','0.004','{"Expedited": 0.03, "Standard": 0.01, "Bulk": 0.0025}',0.05,'{"Expedited": 10.00, "Standard": 0.05, "Bulk": 0.025}',0,0,3)
;
