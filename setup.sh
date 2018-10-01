#!/bin/bash

# Selinux
# 一時的に無効化
setenforce 0

# rabbit
echo "Rabbit setup"
rabbitmqctl add_user openstack openstack20180912
rabbitmqctl set_permissions openstack ".*" ".*" ".*"

# create database
echo "Create database"
mysql -u root -e 'create database keystone;'
mysql -u root -e 'create database glance;'
mysql -u root -e 'create database nova;'
mysql -u root -e 'create database nova_api; '
mysql -u root -e 'create database nova_placement;'
mysql -u root -e 'create database nova_cell0;'
mysql -u root -e 'create database neutron_ml2'

# grant all
echo 'Grant all'
mysql -u root -e 'grant all privileges on keystone.* to keystone@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on keystone.* to keystone@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on glance.* to glance@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on glance.* to glance@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on nova.* to nova@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on nova.* to nova@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on nova_api.* to nova@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on nova_api.* to nova@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on nova_placement.* to nova@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on nova_placement.* to nova@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on nova_cell0.* to nova@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on nova_cell0.* to nova@'%' identified by 'openstack20180912';'

mysql -u root -e 'grant all privileges on neutron_ml2.* to neutron@'localhost' identified by 'openstack20180912';'
mysql -u root -e 'grant all privileges on neutron_ml2.* to neutron@'%' identified by 'openstack20180912';'

mysql -u root -e 'flush privileges;'
