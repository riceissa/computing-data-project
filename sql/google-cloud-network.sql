insert into network_transfer(provider, date_observed, source, destination, transfer_cost) values
    ('Google Compute Engine', '2018-07-21', 'Internet', 'Iowa', '0')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Iowa same zone', '0')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Google products', '0')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Google Cloud Platform service in same region (except Cloud Memorystore for Redis and for Cloud SQL)', '0')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Iowa different zone', '0.01')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Regions in US', '0.01')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Worldwide (except China and Australia but including Hong Kong)', '[[1, 0.12], [10, 0.11], [null, 0.08]]')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'China excluding Hong Kong', '[[1, 0.23], [10, 0.22], [null, 0.20]]')
    ,('Google Compute Engine', '2018-07-21', 'Iowa', 'Australia', '[[1, 0.19], [10, 0.18], [null, 0.15]]')
;
