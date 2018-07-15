create table cloud_instances (
    cloud_instance_id int(11) not null auto_increment primary key,

    # The computing provider, e.g. "Google Compute Engine", "Amazon EC2", "Linode"
    provider varchar(100),

    # Optional name for the instance. A name might not completely specify the
    # specs of an instance, e.g. if the instance corresponding to the name
    # occasionally gets upgrades.
    name varchar(100),

    # Measured in "GB", which could be gigabytes or gibibytes. Some pricing
    # pages don't make it clear which one is being used.
    ram float(6,2),

    # Virtual CPUs (vCPU). Apparently vCPU definitions differ across
    # services but we don't bother to distinguish this?
    cpu float(6,2),

    ecu float(6,2),
    processor varchar(100),

    # This might need to be expanded out to network in/out, etc.
    network_throughput float(6,2),

    storage_type varchar(100),

    # Measured in "GB"
    storage_size float(6,2),

    # Cost per hour of use
    cost float(7,5),

    # This is the date for which the specs and pricing are valid, not the date
    # on which the data was entered
    date_observed date,

    region varchar(100),
    operating_system varchar(100)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
