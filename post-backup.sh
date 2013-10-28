#!/bin/bash
conffile=backuppc-tools.conf
source $conffile
source arch.sh
if [ "$arch_installed_packages" == "1" ] ; then
  post_arch_installed_packages $@
fi
if [ "$snapshot_btrfs" == "1" ] ; then
  post_snapshot_btrfs $@
fi
