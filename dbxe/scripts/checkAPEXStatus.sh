#!/bin/bash
if [ -f "$ORACLE_BASE"/oradata/.APEX.created ]; then
    echo "APEX sudah terinstall"
elif [ -f "$ORACLE_BASE"/oradata/.APEX.failed ]; then
    echo "APEX gagal terinstall"
    exit 1
else
    echo "APEX belum terinstall!" 
    exit 1
fi
