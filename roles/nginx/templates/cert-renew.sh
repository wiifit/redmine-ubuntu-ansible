#!/bin/bash
if /usr/sbin/service nginx stop
then
/usr/bin/certbot renew
fi
/usr/sbin/service nginx start