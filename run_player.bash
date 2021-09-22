#!/bin/bash
echo _______________________________________________________________________________________
######
#  1
# if the player is playiing then kill it.
######
ps -ef|grep omxplayer.bin|grep -v grep
if [[ `ps -ef|grep omxplayer.bin|grep -v grep|wc -l` -gt 0 ]]; then
   echo restart player at `date`
   sudo killall omxplayer.bin
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
echo --------------------------------------------------------------------------------------
xset -display :0 q | egrep -i '(Standby|Screen Saver|blanking|timeout|vol)'

#######
# pause for 1 minute at boot to allow user to update the pi configuration.
args1=$1
if [[ "$args1" -eq init ]]; then
   echo sleep for 60 seconds on init to allow time for user configuration
   echo run a ps ef to get the run_player pids, bucks2, and kill them with dash 9 option
   sleep 60
fi

# Play the mp4 Video file

echo Starting the Video as a background process at `date`
video=`ls -t /home/pi/Videos/*.mp4|head -1`
/usr/bin/omxplayer -loop $video 2>&1 /dev/null
echo =======================================================================================
#/usr/bin/omxplayer --win 300,150,161,93 --vol 10000 --alpha 210 --loop $video 2>&1 /dev/null & 
#/usr/bin/omxplayer --win 300,150,1610,930 --vol 10000 --alpha 210 --loop $video 2>&1 /dev/null & 
# /usr/bin/omxplayer --win 300,150,1610,930  --alpha 210 --vol 10000 --loop $video 2>&1 /dev/null &
# add --vol 10000 to replace the truncated monotonous repeated audio loop with a chrome http audio streaming service such as http;//www.wnyc.org/shows/new_standards - Listen Live
