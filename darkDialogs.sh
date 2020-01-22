#!/bin/bash

echo "This script will install dark dialog theme."
echo "Continue? "
read YN
case $YN in
  nN) exit ;;
  *)  echo "Starting install..."
      git clone https://github.com/ubuntu/yaru
      cd yaru
      meson build
      cd build
      sudo ninja install
      echo "Done!"
      ;;
esac
