MYSQL_ARGS=

read:
	mysql $(MYSQL_ARGS) computingdata -e "drop table if exists cloud_instances"
	mysql $(MYSQL_ARGS) computingdata < sql/cloud-instances-schema.sql
	mysql $(MYSQL_ARGS) computingdata < sql/linode-instances.sql
	mysql $(MYSQL_ARGS) computingdata < sql/digitalocean-instances.sql
