#!/bin/sh

sudo /etc/init.d/libvirt-bin start; sudo start nova-network; sudo start nova-compute; sudo start nova-api; sudo start nova-objectstore; sudo start nova-scheduler; sudo start nova-volume; sudo start glance-api; sudo start glance-registry
