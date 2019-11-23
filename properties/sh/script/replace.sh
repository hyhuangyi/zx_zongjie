#!/bin/sh
echo "----- start sh replace.sh -----"
cd /home/zx
if [ -f /home/zx/zx.jar ]; then
  echo "===== start delete zx.jar ====="
  rm -rf zx.jar
fi
echo  "----- delete success! -----"

echo "===== copy /var/lib/jenkins/workspace/zx-parent/zx-webapp/target/zx.jar to /home/zx ====="

cp /var/lib/jenkins/workspace/zx-parent/zx-webapp/target/zx.jar /home/zx

echo "----- copy success !-----"