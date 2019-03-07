#!/bin/bash

# Script to show EC2 Name tags for IPs connected to MySQL
#
# Usage:
#  > ./mysql_ec2_clients.sh mysql_host mysql_user [aws_profile]
#
# * mysql_host - the mysql host
# * mysql_user - the mysql user
# * aws_profile - name of the aws cli credential profile to use

# Dependencies:
#  - mysql-client
#  - awscli
#  - jq

MYSQL_HOST=$1
MYSQL_USER=$2
AWS_PROFILE=${3:default}

#
# Get IPs of hosts connected to MySQL server
#
ips=$(mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASS \
     -e "SELECT concat(HOST,',',USER) as output FROM INFORMATION_SCHEMA.PROCESSLIST ORDER BY HOST" | \
     awk -F ',' '{split($1,ip,":"); print ip[1], $2}' | sort | uniq | sort | \
     awk '{print $1}' | egrep -v '(localhost|output)' | tr '\n' ',' | sed 's/,$//')

#
# Lookup EC2 host information for those IPs
#
aws --profile $AWS_PROFILE ec2 describe-instances \
    --filters "Name=private-ip-address,Values=$ips" | 
    jq -r '.Reservations[].Instances[0] | (.Tags[]|select(.Key=="Name")|.Value) as $name | "\($name) \(.PrivateIpAddress)"' | \
    column  -t | sort
