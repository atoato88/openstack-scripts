source openrc demo demo
imgid=$(openstack image list -f value -c ID -c Name | grep cirros | awk '{print $1}')
echo ${imgid}
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUvKj1BRui9txgm0paSd1/dHvX+SJXfxg/GgHCj9KhMLt8ZbBcq786Dw7vMO9B6YeA8JqDrFyhZgeNZJGL3nMiht1vrK23hhWCzuTB+w+d2srLBKxEJ3zx2+/QGMNn3a+G9TWr0lp6fmgRj/tWyiE7QAJQOIwdgZGGUt87O2xtGw0u04fe5jsOOv10AsYWabk0yX1YRHzte8/coz2XEIJsg049HyUbhygRvXYMH74i18naXkXV5QFUJO8YGs05NbnwsTLAjYL8YxV28izxIqdBecYG9Vu0rgrGrwZJ7HDLktCFhIziNEBrZI0v73J5eIlOCX8B0iCoEWZ3qHiyOLEz ubuntu@dev-inoh-ubu01" > ./tempkey
openstack keypair create --public-key ./tempkey key01
rm ./tempkey
openstack security group rule create --protocol icmp default
openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 default

nova boot --nic net-name=private --flavor m1.nano --image ${imgid} --key-name key01 --security-groups default vm01

