#!/bin/bash

# catalina.sh stop

cd /opt
ords install --db-hostname ${ORACLE_HOST} --db-port ${ORACLE_PORT} --db-servicename XEPDB1 --feature-sdw true --admin-user sys --password-stdin << EOF
${ORACLE_PWD}
EOF

echo Akan restart tomcat
catalina.sh run