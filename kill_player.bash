#!/bin/bash

#######
#  1
# kill the player
#######
# below implements pkill or pgrep|awk '{printf("kill -9 %d\n',$0)}' or grep|awk '{printf("kill -9 %d\n",$2)}'
# pkill send the default sigterm signal to the process, same as kill -9.  killall implements pkill 
if [[ `ps -ef|grep omxplayer.bin|grep -v grep|wc -l` -gt 0 ]]; then
   sudo killall omxplayer.bin
fi
#######
#  2
# kill crhome audio, not required.
#######
#pkill chrom
#######
#  3
# reset screen blanking after 5 seconds
#######
# on weekends and before after 7am, don't blank the screen.
# comment this out and just use rdp from display :1
#if [[ `date|awk '{print substr($5,1,2)}'` == 07 ]] || [[ `date|awk '{print $1}'` == Sat ]] || [[ `date | awk '{print $1}'` == Sun ]]; then 
#    set -display :0 s reset
#    xset -display :0 s on
#    xset -display :0 s 32767 32767
#    xset -display :0 q
#    exit 0
#fi
xset -display :0 s default
xset -display :0 dpms
xset -display :0 s blank
xset -display :0 s 5 5
xset -display :0 q
