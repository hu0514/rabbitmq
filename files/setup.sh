#!/bin/bash
if [ ! -z $RABBITMQ_USER ];then
    sed -i "s/default_user = guest1/default_user = $RABBITMQ_USER/g" /usr/local/rabbitmq/etc/rabbitmq/rabbitmq.conf
fi
if [ ! -z $RABBITMQ_PASS ];then
    sed -i "s/default_pass = guest1/default_user = $RABBITMQ_PASS/g" /usr/local/rabbitmq/etc/rabbitmq/rabbitmq.conf
fi
exec /usr/local/rabbitmq/sbin/rabbitmq-server
