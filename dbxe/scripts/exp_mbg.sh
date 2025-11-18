#!/bin/bash

expdp system/${ORACLE_PWD}@${PDB_NAME} \
schemas=MBG \
directory=APEX_DIR \
dumpfile=mbg_%t.dmp \
logfile=mbg_export.log \
logtime=ALL \
REUSE_DUMPFILES=YES
