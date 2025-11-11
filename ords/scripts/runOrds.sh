#!/bin/bash


# Check whether ords config already exists
if [ -f "$ORDS_CONFIG"/.ords.created ]; then
     
   echo Ords already setup, starting tomcat..
  
else
   "$SCRIPT_BASE"/is_user_ords_exist.sh

   if [ $? -eq 0 ]; then
      echo User ORDS already exists, dropping user ORDS*..
      "$SCRIPT_BASE"/drop_user_ords.sh
   fi 

   echo Akan setup ords..
   cd /opt
   ords install --db-hostname ${ORACLE_HOST} --db-port ${ORACLE_PORT} --db-servicename ${PDB_NAME} --admin-user sys --password-stdin << EOF
${ORACLE_PWD}
${APX_PWD}
EOF

    sts=$?
    if [ $sts -eq 0 ]; then
        echo "$(date -Iseconds)" > ${ORDS_CONFIG}/.ords.created
        echo Creating file .ords.created..
    else
        echo "Gagal setup ords, exit code $sts"
        exit $sts
    fi

  # Execute custom provided setup scripts
  echo "Running user scripts..."
  "$SCRIPT_BASE"/runUserScripts.sh "$SCRIPT_BASE"/startup

fi;

echo ""
echo Starting TOMCAT...
echo ""
catalina.sh run
