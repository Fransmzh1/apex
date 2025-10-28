#!/bin/bash
if [ -f "$ORACLE_BASE"/oradata/.APEX.created ]; then
    echo "APEX sudah terinstall"
else
    echo "APEX belum terinstall!" 
    exit 1
fi
