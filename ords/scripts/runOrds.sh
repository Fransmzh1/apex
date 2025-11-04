#!/bin/bash


###################################
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
############# MAIN ################
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
###################################


# Check whether ords config already exists
if [ -f "$ORDS_CONFIG"/.ords.created ]; then
     
   echo Ords already setup, starting ords..
  
else
   check_user_ords.sh
   sts=$?

   if [ $sts -eq 0 ]; then
      echo User ORDS already exists, dropping user ORDS*..
      drop_user_ords.sh
   fi 

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

  # Execute custom provided setup scripts

#   /opt/scripts/runUserScripts.sh /opt/scripts/startup

fi;


echo Akan start tomcat
catalina.sh run
