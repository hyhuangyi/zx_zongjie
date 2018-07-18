#!/bin/sh

##todat's date
date=`date "+%Y-%m-%d"`

##three days ago's date
date1=`date -d -3days "+%Y-%m-%d"`

filepath=/home/dbbak/wd/${date}

filepath1=/home/dbbak/wd/${date1}

filepath2=/home/dbbak/wd/log

if [ ! -d "${filepath2}" ]; then
   mkdir ${filepath2}
fi

##remove 3days ago's file
if [ -d "$filepath1" ]; then
  echo "remove ${filepath1}">>${filepath2}/${date}.log
  rm -rf ${filepath1}
fi

##create today's file
if [ ! -d "${filepath}" ]; then
   echo "mkdir backup file by date">>${filepath2}/${date}.log
   mkdir ${filepath}
fi

chmod 777 -R ${filepath}

##backup on line
su - db2admin -c "db2 backup db hmnd online to ${filepath}">>${filepath2}/${date}.log

cd /home/dbbak/wd

zip -r -q -o ${date}.zip ${date}

lftp -u dbbak,dbbak sftp://10.1.12.25<<EOF
cd /home/dbbak/wd
put /home/dbbak/wd/${date}.zip

bye

EOF

rm -rf ${date}.zip

exit 0;
