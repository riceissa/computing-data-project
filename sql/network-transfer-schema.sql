create table network_transfer (
    network_transfer_id int(11) not null auto_increment primary key,

    provider varchar(100),

    # This is the date for which the cost is valid, not the date
    # on which the data was entered
    date_observed date,

    # This should be the same as the region
    source varchar(500),

    destination varchar(500),

    transfer_cost varchar(100)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
