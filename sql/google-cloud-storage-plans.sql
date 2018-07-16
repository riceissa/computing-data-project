insert into storage_plans(provider,name,date_observed,region,storage_cost,download_cost,write_op_cost,read_op_cost,list_op_cost,delete_op_cost,minimum_duration) values
    ('Google Cloud Storage','Regional Storage','2018-07-16','Iowa','0.02','0',0.005,'0.0004',0.005,0,0)
    ,('Google Cloud Storage','Nearline Storage','2018-07-16','Iowa','0.01','0.01',0.010,'0.001',0.010,0,1)
    ,('Google Cloud Storage','Coldline Storage','2018-07-16','Iowa','0.007','0.05',0.010,'0.005',0.010,0,3)
;
