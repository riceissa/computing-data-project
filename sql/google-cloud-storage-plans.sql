insert into storage_plans(provider,name,date_observed,region,storage_cost,download_cost,write_op_cost,read_op_cost,list_op_cost,delete_op_cost,minimum_duration) values
    ('Google Cloud Storage','Regional Storage','2018-07-16','Iowa','0.02','0',0.005,'0.0004',0.005,0,0)
    ,('Google Cloud Storage','Nearline Storage','2018-07-16','Iowa','0.01','0.01',0.010,'0.001',0.010,0,1)
    ,('Google Cloud Storage','Coldline Storage','2018-07-16','Iowa','0.007','0.05',0.010,'0.005',0.010,0,3)

    ,(
        'Google Cloud Storage',
        'Regional Storage',
        '2019-06-19',
        'Iowa',
        '0.02', /* storage_cost */
        '0', /* download_cost */
        0.005, /* write_op_cost */
        '0.0004', /* read_op_cost */
        0.005, /* list_op_cost */
        0, /* delete_op_cost */
        0 /* minimum_duration */
    )
    ,(
        'Google Cloud Storage',
        'Nearline Storage',
        '2019-06-19',
        'Iowa',
        '0.01', /* storage_cost */
        '0.01', /* download_cost */
        0.010, /* write_op_cost */
        '0.001', /* read_op_cost */
        0.010, /* list_op_cost */
        0, /* delete_op_cost */
        1 /* minimum_duration */
    )
    ,(
        'Google Cloud Storage',
        'Coldline Storage',
        '2019-06-19',
        'Iowa',
        '0.004', /* storage_cost */
        '0.05', /* download_cost */
        0.010, /* write_op_cost */
        '0.005', /* read_op_cost */
        0.010, /* list_op_cost */
        0, /* delete_op_cost */
        3 /* minimum_duration */
    )
;
