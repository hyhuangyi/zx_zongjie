#!/bin/sh
echo "----- start sh start.sh -----"
chmod 777 /home/zx/zx.jar
cd /home/zx
java -server -Xms512m -Xmx512m -Xmn256m -jar zx.jar 
echo "----- start success! -----"