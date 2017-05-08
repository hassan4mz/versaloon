#!/bin/bash
WORKDIR="$PWD/release/firmware/STM32F103C8_BluePill"
LOGFILE="$WORKDIR/build.log"
rm -f $LOGFILE
exec &> >(tee -a "$LOGFILE")
docker build -t versaloon:latest .
docker run -v $WORKDIR:/mnt versaloon:latest cp -v /home/versaloon/code/dongle/firmware/Projects/Versaloon/GCC/*.{hex,elf} /mnt
