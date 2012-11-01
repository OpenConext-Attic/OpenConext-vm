#!/bin/sh

echo |openssl s_client -connect api.demo.openconext.org:443 2>&1 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sudo keytool -import -trustcacerts -alias "api cacert" -keystore /usr/java/jdk1.6.0_32/jre/lib/security/cacerts -storepass changeit -noprompt

service tomcat6 stop
killall -9 java
sleep 15
service tomcat6 start
