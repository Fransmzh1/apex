#!/bin/bash

if [ -f ${ORDS_CONFIG}/.ords.created ]; then
    sts=10
    echo File .ords.created sudah ada !
else
    cd /opt
    ords install --db-hostname ${ORACLE_HOST} --db-port ${ORACLE_PORT} --db-servicename XEPDB1 --admin-user sys --password-stdin << EOF
${ORACLE_PWD}
EOF

    sts=$?
fi

echo Status $sts akan setup flag file .ords.created
if [ $sts -eq 0 ]; then
    echo "$(date -Iseconds)" > ${ORDS_CONFIG}/.ords.created
fi

echo Akan start tomcat
catalina.sh run