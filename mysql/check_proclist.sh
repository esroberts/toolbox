#!/bin/bash

# Script to log MySQL processlist output.  Useful in diagnosing
# MySQL crash issues (e.g. high thread count, query lockup).
#
# Usage:
# > ./check_proclist.sh
#

# Dependencies:
#  - ~/.my.cnf or mysql_config_editor with user/pass for user running the script.  
#  - logrotate to keep log files in check
#  - cronjob to run this script regularly

# Full proclist that can be easily parsed by awk
PROCLIST_LOG="/var/log/mysql_proclist/proclist.log"

# Connection count per user
USERS_LOG="/var/log/mysql_proclist/users.log"

# Threshold that must be met in order for proclist to be pulled and logged
CONNECTION_THRESHOLD=1000


# Get current connection count
num_conn=$(mysql -e "select count(1), user from information_schema.processlist"  | awk -F '|' '{print $1}' | awk '{print $1}' | tail -n 1)


if [ "$num_conn" -gt "$CONNECTION_THRESHOLD" ]; then
    date=$(date)
    echo $date >> $PROCLIST_LOG
    mysql -e "select user, host, time, db, state, SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(info,CHAR(13), ''),CHAR(10),''),'\n',''),',',' ') ,1,350 ) as cmd  from information_schema.processlist order by cmd asc;" >> $PROCLIST_LOG
    echo $date >> $USERS_LOG
    mysql -e "select count(1), user from information_schema.processlist group by user" >> $USERS_LOG
fi
