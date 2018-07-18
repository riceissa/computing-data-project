insert into storage_plans(provider,name,redundancy,date_observed,region,storage_cost,download_cost,write_op_cost,read_op_cost,list_op_cost,delete_op_cost,minimum_duration) values
    ('Microsoft Azure','Azure Block Blob General Purpose v2 Hot','LRS','2018-07-18','East US','[[50, 0.0208], [500, 0.02], [null, 0.0192]]','0',0.005,'0.0004',0.005,0,NULL)
    ,('Microsoft Azure','Azure Block Blob General Purpose v2 Cool','LRS','2018-07-18','East US','0.0152','0.01',0.010,'0.001',0.005,0,NULL)
    ,('Microsoft Azure','Azure Block Blob General Purpose v2 Archive','LRS','2018-07-18','East US','0.002','0.02',0.010,'0.5',0.005,0,NULL)
;
