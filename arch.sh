#!/bin/bash

explicit_file="explicit_packages"
pre_arch_installed_packages () {
  pacman -Qe > "$explicit_file"
}

post_arch_installed_packages () {
  rm "$explicit_file"
}
