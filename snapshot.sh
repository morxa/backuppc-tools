#!/bin/bash
pre_snapshot () {
  backupsv="$2"
  mountpoint=$(echo $1 | sed "s:$backupsv/\?::")
  if [ "$mountpoint" == "$1" ] ; then
    echo "Target isn't a $backupsv folder. Do nothing."
    exit 0
  fi
  fs=$(df -T $mountpoint | tail -n +2 | awk {'print $2'})
  if [ $fs != "btrfs" ] ; then
    echo "creating symlink"
    ln -vs $mountpoint $1
    exit 0
  fi
  
  btrfs subvolume snapshot -r $mountpoint $1
  if [ $? -ne 0 ] ; then
    exit $?
  fi
}

post_snapshot () {
  backupsv="$2"
  mountpoint=$(echo $1 | sed "s:$backupsv/\?::")
  if [ "$mountpoint" == "$1" ] ; then
    echo "Target isn't a $backupsv folder. Do nothing."
    exit 0
  fi
  fs=$(df -T $mountpoint | tail -n +2 | awk {'print $2'})
  if [ $fs != "btrfs" ] ; then
    echo "deleting softlink"
    rm -v $1
    exit 0
  fi
  
  btrfs subvolume delete $1
  if [ $? -ne 0 ] ; then
    return $?
  fi
}
