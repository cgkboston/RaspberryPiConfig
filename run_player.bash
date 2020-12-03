#!/bin/bash
date
######
#  1
# if the player is playiing then kill it.
######
ps -ef|grep omxplayer.bin|grep -v grep
if [[ `ps -ef|grep omxplayer.bin|grep -v grep|wc -l` -gt 0 ]]; then
   echo restart player at `date`
   sudo killall omxplayer.bin
else
   echo start player at `date`
fi

######
#  2
# set/show (q) the display parameters
######
echo reset display
xset -display :0 s reset
xset -display :0 s on
echo $?
# prevent screen blanking and cycling, set timeout to max available
echo Increase the timeout to approximately 9 hours
xset -display :0 s 32767 32767  # this is the max timeout ~9 hours can also disable with 0 0.
echo $?
# show the current settings for :display 0 (hdmi:0)
xset -display :0 q | egrep -i '(Standby|Screen Saver|blanking|timeout|vol)'

# Play the mp4 Video file
echo __________________________________
date
echo Starting the Video as a background process in 5 seconds
video=`ls -t /home/pi/Videos/*.mp4|head -1`
sleep 5
/usr/bin/omxplayer --win 300,150,161,93 --vol 10000 --alpha 210 --loop $video 2>&1 /dev/null & 
#/usr/bin/omxplayer --win 300,150,1610,930 --vol 10000 --alpha 210 --loop $video 2>&1 /dev/null & 
# /usr/bin/omxplayer --win 300,150,1610,930  --alpha 210 --vol 10000 --loop $video 2>&1 /dev/null &
# add --vol 10000 to replace the truncated monotonous repeated audio loop with a chrome http audio streaming service such as http;//www.wnyc.org/shows/new_standards - Listen Live
