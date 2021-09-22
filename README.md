# RaspberryPiConfig Put this file in the Documents folder on a newly configured pi
=========================================================================

to configure the pi:
1. boot the pi
2. within one minute, chmod 600 bin/run_player.bash
3. ps -ef|grep run_player.bash|grep sleep | grep pi | grep -v grep|awk '{printf("kill -9 %d\n",$2)}'
4. execute the two lines resulting from the last step
5. make changes, for example update a Video in the Videos folder or touch a Video to make it the one to play.
==========================================================================

some commands to know
1. cat /etc/wpa_supplicant/wpa_supplicant.conf
2. omxplayer --help
3. uname -a
4. ifconfig | grep -v eth:0
5. hostname
6. passwd
7. sudo
8. crontab -e # to update the cron columns in classic mode.
9. export VISUAL="vi" # to update your default crontab editor the file is ~/.bash_profile
