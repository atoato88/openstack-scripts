#!/bin/sh

sudo /etc/init.d/libvirt-bin stop; sudo stop nova-network; sudo stop nova-compute; sudo stop nova-api; sudo stop nova-objectstore; sudo stop nova-scheduler; sudo stop nova-volume; sudo stop glance-api; sudo stop glance-registry
