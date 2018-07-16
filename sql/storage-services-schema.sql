create table storage_plans (
    storage_plan_id int(11) not null auto_increment primary key,

    # Fields that make sense for both object and block storage
    # ========================================================
    provider varchar(100),  # Storage provider, e.g. "Amazon S3", "Amazon EBS"
    name varchar(100),  # Name of the plan, e.g. "Azure Managed Disks P4"
    region varchar(100),  # https://azure.microsoft.com/en-us/pricing/details/managed-disks/ https://azure.microsoft.com/en-us/pricing/details/storage/blobs/

    # This is the date for which the specs and pricing are valid, not the date
    # on which the data was entered
    date_observed date,

    # The storage pricing plan as a string. If the plan is just a single rate,
    # the format is a float (as a string), in dollars per GB per month. Otherwise it is a
    # tiered plan and this should be a JSON list of lists, where the inner list
    # is [bound, rate] for each tier (bound in TB, rate in dollars per GB per
    # month). The bound on the final tier item is not used (as it the tier
    # saying "everything above the previous tier"), and can for clarity be null.
    # The tiers must be ordered by the bound.
    # Example: '[[50, 0.023], [500, 0.022], [null, 0.021]]'. The meaning of
    # this is that from 0 to 50 TB, the rate is $0.023/GB/month; from 50 to 500 TB, the
    # marginal storage costs $0.022/GB/month; and after 500 TB, the marginal storage
    # costs $0.021/GB/month.
    storage_cost varchar(1000),

    redundancy varchar(100), # e.g. azure has LRS, ZRS, GRS, etc. https://azure.microsoft.com/en-us/pricing/details/storage/blobs/ https://azure.microsoft.com/en-us/pricing/details/managed-disks/

    # Fields that only make sense for object storage
    # ==============================================
    # The download cost or "data retrieval" cost as a string, in dollars per
    # GB. If the cost structure is just a single rate, the format is a float
    # (as a string). Otherwise it is a JSON dictionary of key-value pairs,
    # where the keys are qualitative descriptions of the retrieval type and
    # the values are the corresponding rates.
    # Example: '{"Expedited": 0.03, "Standard": 0.01, "Bulk": 0.0025}'.
    download_cost varchar(1000),
    upload_cost float(7,5), # in $/GB. I think this is the same as "data write" https://azure.microsoft.com/en-us/pricing/details/storage/blobs/
    # transfer_cost # waiting on this until we do network stuff. e.g. to another region https://azure.microsoft.com/en-us/pricing/details/storage/blobs/ This can depend on the region so it's actually a function...
    write_op_cost float(7,5),  # in dollars per 1,000 requests
    read_op_cost float(7,5),  # in dollars per 1,000 requests
    list_op_cost float(7,5),  # in dollars per 1,000 requests
    delete_op_cost float(7,5),  # in dollars per 1,000 requests
    minimum_duration float(4,2),  # in months

    # Fields that only make sense for block storage
    # =============================================
    storage_type varchar(100),  # SSD/HDD, etc.
    disk_size float(6,1),  # in GB; google and amazon don't have fixed sizes
    iops_cost float(7,5),  # cost for IOPS (input/output operations per second), in $/IOPS/month; see https://aws.amazon.com/ebs/pricing/
    iops float(7,2),  # per disk https://azure.microsoft.com/en-us/pricing/details/managed-disks/
    # iops_burst_performance # ??? https://aws.amazon.com/ebs/previous-generation/
    throughput float(7,5),  # per disk, in MB/second https://azure.microsoft.com/en-us/pricing/details/managed-disks/
    # throughput_burst_performance # ??? https://aws.amazon.com/ebs/previous-generation/
    # throughput_instance # throughput per instance; EBS previous gen has both this and throughput per disk https://aws.amazon.com/ebs/previous-generation/
    io_cost float(7,5),  # in $/(million ops). It looks like EBS prev gen didn't use IOPS for pricing https://aws.amazon.com/ebs/previous-generation/
    minimum_volume_size float(7,5),  # in GB; google's local SSD provisioned space has 375GB minimum https://cloud.google.com/persistent-disk/
    maximum_volume_size float(7,5),  # in GB; https://www.linode.com/blockstorage
    snapshot bool  # a boolean to track whether this is snapshot storage?
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
