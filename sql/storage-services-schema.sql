create table storage_plans (
    storage_plan_id int(11) not null auto_increment primary key,

    # Fields that make sense for both object and block storage
    provider varchar(100),  # Storage provider, e.g. "Amazon S3", "Amazon EBS"
    name varchar(100),  # Name of the plan, e.g. "Azure Managed Disks P4"
    region varchar(100),  # https://azure.microsoft.com/en-us/pricing/details/managed-disks/ https://azure.microsoft.com/en-us/pricing/details/storage/blobs/
    redundancy? # e.g. azure has LRS, ZRS, GRS, etc. https://azure.microsoft.com/en-us/pricing/details/storage/blobs/ https://azure.microsoft.com/en-us/pricing/details/managed-disks/

    # Fields that only make sense for object storage
    storage_cost # in $/GB/month. This has to somehow accept tiered pricing like on s3 https://aws.amazon.com/s3/pricing/?nc=sn&loc=4 and https://azure.microsoft.com/en-us/pricing/details/storage/blobs/
    download_cost # in $/GB. I think this is the same as "data retrival" https://azure.microsoft.com/en-us/pricing/details/storage/blobs/
    upload_cost? # in $/GB. I think this is the same as "data write" https://azure.microsoft.com/en-us/pricing/details/storage/blobs/
    # transfer_cost # waiting on this until we do network stuff. e.g. to another region https://azure.microsoft.com/en-us/pricing/details/storage/blobs/ This can depend on the region so it's actually a function...
    write_op_cost # in $/10000 or $/1000
    read_op_cost # in $/10000 or $/1000
    list_op_cost # in $/10000 or $/1000
    delete_op_cost # in $/10000 or $/1000
    minimum_duration # units?
    retrieval_delay # units?

    # Fields that only make sense for block storage
    storage_type # SSD/HDD, etc.
    disk_size # in GB; google and amazon don't have fixed sizes
    storage_cost # in $/GB/month? or $/month since we already have the disk_size? but google's disks seem to have flexible sizing so we don't know the size necessarily https://cloud.google.com/persistent-disk/
    iops_cost # cost for IOPS (input/output operations per second), in $/IOPS/month; see https://aws.amazon.com/ebs/pricing/
    iops # per disk https://azure.microsoft.com/en-us/pricing/details/managed-disks/
    iops_burst_performance # ??? https://aws.amazon.com/ebs/previous-generation/
    throughput # per disk, in MB/second https://azure.microsoft.com/en-us/pricing/details/managed-disks/
    throughput_burst_performance # ??? https://aws.amazon.com/ebs/previous-generation/
    throughput_instance # throughput per instance; EBS previous gen has both this and throughput per disk https://aws.amazon.com/ebs/previous-generation/
    io_cost # in $/(million ops). It looks like EBS prev gen didn't use IOPS for pricing https://aws.amazon.com/ebs/previous-generation/
    minimum_volume_size # in GB; google's local SSD provisioned space has 375GB minimum https://cloud.google.com/persistent-disk/
    maximum_volume_size # in GB; https://www.linode.com/blockstorage
    snapshot # a boolean to track whether this is snapshot storage?


) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
