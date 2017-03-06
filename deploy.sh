#!/bin/sh
RARNAME="/var/lib/tomcat7/webapps/eBay.war"

rm /var/lib/tomcat7/webapps/eBay.war
rm -rf /var/lib/tomcat7/webapps/eBay
ant build
mv /home/cs144/shared/project4/CS144_p4/build/eBay.war /var/lib/tomcat7/webapps
chmod a+rw $RARNAME
sudo /etc/init.d/tomcat7 restart
