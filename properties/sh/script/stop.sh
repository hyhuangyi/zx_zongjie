#!/bin/sh
echo "......find pid.........."
pid=`ps -ef | grep zx.jar | grep -v grep | awk '{print $2}'`
echo "zx.jar's pid:" $pid
if [ -n "$pid" ]
then
#!kill -9 强制终止
   kill -9 $pid
fi
echo "----- stop success! -----" 