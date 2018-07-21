create table network_transfer (
    network_transfer_id int(11) not null auto_increment primary key,

    provider varchar(100),

    # This is the date for which the cost is valid, not the date
    # on which the data was entered
    date_observed date,

    # For outgoing/egress this should be the same as the instance region
    source varchar(500),

    destination varchar(500),

    # The transfer cost as a string. If the cost is just a single rate,
    # the format is a float (as a string), in dollars per GB. Otherwise it is a
    # tiered plan and this should be a JSON list of lists, where the inner list
    # is [bound, rate] for each tier (bound in TB, rate in dollars per GB).
    # The bound on the final tier item is not used (as it is the tier
    # saying "everything above the previous tier"), and should be null.
    # The tiers must be ordered by the bound.
    # Example: '[[50, 0.023], [500, 0.022], [null, 0.021]]'.
    transfer_cost varchar(100)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
