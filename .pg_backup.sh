#!/bin/bash
 2 db_name=db_name
 3 db_user=user_name
 4 db_host=hostname
 5 backupfolder=~/DBBackUps
 6 # Сколько дней хранить файлы
 7 keep_day=30
 8 sqlfile=$backupfolder/$db_name-$(date +%y.%m.%d-%H:%M:%S).sql
 9 mkdir -p $backupfolder
10
11 if pg_dump -U $db_user -h $db_host $db_name > $sqlfile; then
12    echo 'Sql dump created'
13 else
14    echo 'pg_dump return non-zero code'
15    exit
16 fi
17
18 find $backupfolder -mtime +$keep_day -delete
