#!/bin/bash
conffile=backuppc-tools.conf
source $conffile
source $sources
source arch.sh
if [ "$conf_arch_installed_packages" == "1" ] ; then
  pre_arch_installed_packages $@
fi
