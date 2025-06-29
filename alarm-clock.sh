#!/bin/bash

# Novimatrem's alarm clock script, for the waking up. - Licensed under the GNU GPL v3.0.
# (epilepsy warning)
# REQUIRES and DEPENDS UPON kdialog, espeak, paplay, bash, and a working 'fortune' command.
# The alarm currently triggers at a set time by default and there is no simple way to adjust this outside of editing the bash scripts manually in multiple places, at the moment.

# License information
# This product is licensed under the GNU GPL v3.0.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License (v3.0) for more details.
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see https://www.gnu.org/licenses/gpl-3.0.en.html.
# THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
# APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
# AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE
# RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
# PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
# REPAIR OR CORRECTION.


# Script;Start

clear

# INTRO MESSAGE

echo "Novimatrem's alarm clock script, for the waking up. - Licensed under the GNU GPL v3.0."
echo "(epilepsy warning)"
echo "REQUIRES and DEPENDS UPON kdialog, espeak, paplay, bash, and a working 'fortune' command."
echo "The alarm currently triggers at a set time by default and there is no simple way to adjust this outside of editing the bash scripts manually in multiple places, at the moment."

echo ""

echo "This product is licensed under the GNU GPL v3.0."
echo "( https://www.gnu.org/licenses/gpl-3.0.en.html )"
cd "$(dirname "$0")"
echo ""
ls
echo ""
CURPATH=$(pwd)
echo '$CURPATH is' && echo $CURPATH
echo ""

chmod +x alert.sh
chmod +x noisemaker.sh
chmod +x alarm-clock.sh

# delay to make sure it starts at the correct time to actually work
sleep 20s

notify-send "${0##*/} only works when unmuted and unlocked"
cd "$(dirname "$0")"
paplay $(pwd)/warning-beep.wav


sleep 20s
# i am never having pulse cuck me again
clear
sleep 1.5s
clear
notify-send "${0##*/} Speaker Test: Front Left"
speaker-test -t wav -l 1 -c 2 &
sleep 1.5s
notify-send "${0##*/} Speaker Test: Front Right"
sleep 1.5s
sleep 0.5s
echo ""
clear
# /i am never having pulse cuck me again


# This entire script is a while true loop.
while true
do
clear
# Attempt to keep the system awake so the script can actually do its purpose
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 0
#DISABLED DUE TO CAUSING FPS ISSUES #xset -dpms
#DISABLED DUE TO CAUSING FPS ISSUES #xset s noblank
#DISABLED DUE TO CAUSING FPS ISSUES #xset s off
gsettings set org.gnome.settings-daemon.plugins.power active false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
setterm -blank 0
setterm -blank 0 -powerdown 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '0' && gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '0'
killall mate-screensaver
pkill mate-screensaver
killall xscreensaver
pkill xscreensaver
killall xfce4-screensaver
pkill xfce4-screensaver
# /Attempt to keep the system awake so the script can actually do its purpose
clear
echo "Current time hour is:"
# Get the current time in 24 hours as a number.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEHOURTIMEKEEPING="$(echo 06)"
#TIMEMINUTETIMEKEEPING="$(echo 59)"

# Echo the gathered result.
echo $TIMEHOURTIMEKEEPING
echo ":"
echo $TIMEMINUTETIMEKEEPING

echo "(waiting for 06:59)"
echo ""

# Compare the TIMEHOURTIMEKEEPING with the hour that we wish to perform an action at.

# If at time hour 06, cont.
if [ $TIMEHOURTIMEKEEPING -eq 06 ]
then
if [ $TIMEMINUTETIMEKEEPING -eq 59 ]
then
    echo "Time is right, do attempt!"
    echo ""
    sleep 0s
    bash alert.sh
fi
fi

# Sleep for 1 second so we don't lag the system with very many checks.
    sleep 1
done

exit

