create table cloud_instance_specs (
    cloud_instance_spec_id int(11) not null auto_increment primary key,
    name varchar(100) not null,
    ram float(6,2),
    cpu float(6,2),
    ecu float(6,2),
    processor varchar(100),
    network_throughput float(6,2),
    storage varchar(100),
    unique key name(`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
