insert into network_transfer(provider, date_observed, source, destination, transfer_cost) values
    ('Microsoft Azure', '2018-07-21', 'Internet', 'East US', '0')
    ,('Microsoft Azure', '2018-07-21', 'East US', 'Internet', '[[0.005, 0], [10, 0.087], [50, 0.083], [150, 0.07], [500, 0.05], [null, null]]')

    # http://archive.today/2019.07.09-215956/https://azure.microsoft.com/en-us/pricing/details/bandwidth/
    ,('Microsoft Azure', '2019-07-09', 'Internet', 'East US', '0')
    ,('Microsoft Azure', '2019-07-09', 'East US', 'Internet', '[[0.005, 0], [10, 0.087], [50, 0.083], [150, 0.07], [500, 0.05], [null, null]]')
;
