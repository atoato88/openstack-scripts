#!/bin/sh

sudo /etc/init.d/libvirt-bin restart; sudo restart nova-network; sudo restart nova-compute; sudo restart nova-api; sudo restart nova-objectstore; sudo restart nova-scheduler; sudo restart nova-volume; sudo restart glance-api; sudo restart glance-registry
