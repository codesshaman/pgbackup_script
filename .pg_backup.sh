#!/bin/bash
 db_name=db_name
 db_user=user_name
 db_host=hostname
 backupfolder=~/DBBackUps
 # Сколько дней хранить файлы
 keep_day=30
 sqlfile=$backupfolder/$db_name-$(date +%y.%m.%d-%H:%M:%S).sql
 mkdir -p $backupfolder

if pg_dump -U $db_user -h $db_host $db_name > $sqlfile; then
   echo 'Sql dump created'
else
   echo 'pg_dump return non-zero code'
   exit
fi

find $backupfolder -mtime +$keep_day -delete
