#!/bin/sh

MYSQL_PASS='root'

sudo nova-manage project scrub proj
if test 0 -eq $? ; then
  echo success project scrub
else
  echo failure project scrub
fi

sudo mysql -uroot -p$MYSQL_PASS -Dnova -e "delete from networks;"
if test 0 -eq $? ; then
  echo success delete networks
else
  echo failure delete networks
fi

sudo mysql -uroot -p$MYSQL_PASS -Dnova -e "delete from fixed_ips;"

if test 0 -eq $? ; then
  echo success delete fixed_ips
else
  echo failure delete fixed_ips
fi
