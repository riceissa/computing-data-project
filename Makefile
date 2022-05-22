MYSQL_ARGS=
DATABASE=computingdata

.PHONY: init
init:
	mysql $(MYSQL_ARGS) -e "create database if not exists $(DATABASE)"

.PHONY: reset
reset:
	mysql $(MYSQL_ARGS) $(DATABASE) -e "drop table if exists cloud_instances"
	mysql $(MYSQL_ARGS) $(DATABASE) -e "drop table if exists storage_plans"
	mysql $(MYSQL_ARGS) $(DATABASE) -e "drop table if exists network_transfer"

.PHONY: read
read:
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/cloud-instances-schema.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/storage-services-schema.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/network-transfer-schema.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/linode-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/digitalocean-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/ec2-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/ec2-instances-manual.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/ec2-spot-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/amazon-lightsail-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/gce-instances.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/azure-virtual-machines.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/s3-plans.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/google-cloud-storage-plans.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/azure-blob-storage.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/linode-block-storage.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/ebs-plans.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/google-cloud-persistent-disk.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/azure-managed-disks.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/digitalocean-block-storage.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/ec2-network.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/google-cloud-network.sql
	mysql $(MYSQL_ARGS) $(DATABASE) < sql/azure-network.sql

.PHONY: fetch_tablesorter
fetch_tablesorter:
	curl -Lo access-portal/jquery.min.js \
		'https://code.jquery.com/jquery-3.2.1.min.js'
	curl -Lo access-portal/jquery.tablesorter.js \
		'https://raw.githubusercontent.com/Mottie/tablesorter/master/js/jquery.tablesorter.js'
	curl -Lo access-portal/tablesorter.css \
		'https://raw.githubusercontent.com/riceissa/tablesorter-bare-bones-theme/master/theme.css'

.PHONY: clean_tablesorter
clean_tablesorter:
	rm -f access-portal/jquery.min.js
	rm -f access-portal/jquery.tablesorter.js
	rm -f access-portal/tablesorter.css

.PHONY: fetch_anchorjs
fetch_anchorjs:
	curl -Lo access-portal/anchor.min.js \
		'https://raw.githubusercontent.com/bryanbraun/anchorjs/master/anchor.min.js'

.PHONY: clean_anchorjs
clean_anchorjs:
	rm -f access-portal/anchor.min.js
