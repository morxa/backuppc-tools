#!/bin/bash
conffile=backuppc-tools.conf
source $conffile
source $sources

if [ "$conf_snapshot" == "1"] ; then
 post_snapshot $@
fi 
