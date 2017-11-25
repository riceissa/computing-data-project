create table cloud_instance_costs (
    cloud_instance_cost_id int(11) not null auto_increment primary key,
    name varchar(100) not null,

    # Cost per hour
    cost float(7,5),

    odate date,
    region varchar(100),
    operating_system varchar(100),
    unique key name(`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
