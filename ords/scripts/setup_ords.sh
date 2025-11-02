#!/bin/bash

if [ -f ${ORDS_CONFIG}/.wks.created ]; then
    echo Workspace already exists!

else
    echo Initial workspace creating .. 
    cd /opt/scripts
    
    sql -s sys/${ORACLE_PWD}@db:1521/XEPDB1 as sysdba <<EOF
    cd scripts
    set heading off;
    @cr_user.sql
    @WKS1.sql
    exit;
EOF

    sts=$?
    if [ $sts -eq 0 ]; then
        echo Creating file .wks.created..
        echo "$(date -Iseconds)" > ${ORDS_CONFIG}/.wks.created
    else
        echo Error create workspace !
    fi

fi

if [ -f ${ORDS_CONFIG}/.ords.created ]; then
    echo File .ords.created sudah ada !
else
    echo Akan setup ords..
    cd /opt
    ords install --db-hostname ${ORACLE_HOST} --db-port ${ORACLE_PORT} --db-servicename XEPDB1 --admin-user sys --password-stdin << EOF
${ORACLE_PWD}
EOF

    sts=$?
    echo Creating file .ords.created..
    if [ $sts -eq 0 ]; then
        echo "$(date -Iseconds)" > ${ORDS_CONFIG}/.ords.created
    fi

fi


echo Akan start tomcat
catalina.sh run