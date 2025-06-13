#!/bin/bash

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
echo ""
echo "DEBUG: in noisemaker"
echo ""
# Final check, for accuracy.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEHOURTIMEKEEPING="$(echo 06)"
#TIMEMINUTETIMEKEEPING="$(echo 59)"


# Try to account for delays, to start making noise at exactly 07:00:00 AM


# HACK: actually, let's wake up at 8 instead.


# it turns out, the latest sunrise in 2021 was at 8:25.
# i never want to wake up in the dark, so let's ensure I wake at 8:30 instead.


# Wake the system (find a command for this, seems rare/non-existent)
echo "wake the system command goes here"
echo ""

# begin log
cd "$(dirname "$0")"
touch log.txt
echo "==========================================" >> log.txt
echo "Noisemaker started at $(date)" >> log.txt

# Restart pulse before the alert plays,
# to ensure we don't have a repeat of that day 
# where I didn't wake up, and missed my morning estrogen.
pulseaudio -k
killall pulseaudio
pkill pulseaudio
systemctl --user stop pulseaudio.service pulseaudio.socket
systemctl --user stop pulseaudio
systemctl --user restart pulseaudio
systemctl --user restart pulseaudio.service
systemctl --user restart pulseaudio.socket
killall pulseaudio
killall pipewire
pipewire &
pipewire-pulse &
pulseaudio --start
pulseaudio
# Switch sound device
#pacmd set-default-sink "alsa_output.pci-0000_01_00.1.hdmi-stereo"

# give everything enough time to start up or else the script fails and halts.
echo ""
echo "Giving everything 15 seconds to start up which is enough time or else the script fails and halts..."
echo ""
pulseaudio -k
sleep 15s
# /give everything enough time to start up or else the script fails and halts.
echo ""
echo "Starting quick and dirty debugging..."
echo ""

# Unmute the speakers
amixer set Master unmute
amixer -q -D pulse sset Master unmute
pactl set-sink-mute 0 0
pactl set-sink-mute 1 0

# unmute everything
amixer set Master unmute
amixer -q -D pulse sset Master unmute
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-mute 0 0
pactl set-sink-mute 1 0
pactl set-sink-mute 2 0
pactl set-sink-mute 3 0
pactl set-sink-mute 4 0
pactl set-sink-mute 5 0
pactl set-sink-mute 6 0
pactl set-sink-mute 7 0
pactl set-sink-mute 8 0
pactl set-sink-mute 9 0
pactl set-sink-mute 10 0
pactl set-sink-mute 11 0
pactl set-sink-mute 12 0
pactl set-sink-mute 13 0
pactl set-sink-mute 14 0
pactl set-sink-mute 15 0

# if you ever end up with more than 16 output devices you may need to add more to this
# but that will never happen

# /unmute everything

echo ""

echo ""
set -x


# Speaker warming
cd "$(dirname "$0")"






echo ""

echo ""

#echo 2s

# Speaker warming 2
cd "$(dirname "$0")"



#echo 2s

# Set volume to reasonable percentage to wake me up, but not to deafen the neighborhood
echo ""
echo "Speaker volume to a %!"
echo ""
amixer -D pulse sset Master 45%
pactl set-sink-volume @DEFAULT_SINK@ 45%

function flashing {
echo 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
echo 0.01
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
echo 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
echo 0.1
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
echo 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
echo 0.1
}

# Fluctuate brightness to alert me
flashing
# IF YOU ARE OF THE ALARM CLOCK SCRIPT, AND THUS THIS FILE IS IN YOUR FOLDER, ALSO RUN THE RADIO ALONGSIDE
cd "$(dirname "$0")"
echo "Entering the alsoradio script at $(date)" >> log.txt
sleep 0s && nohup bash $(pwd)/alsoradio.sh && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""
# alsogame removed due to issues with the script that fixes my monitor
echo "Are past the alsoradio script in noisemaker.sh at $(date)" >> log.txt
cd "$(dirname "$0")"
echo "Entering the alsonote script at $(date)" >> log.txt
sleep 0s && nohup bash $(pwd)/alsonote.sh && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""
# alsogame removed due to issues with the script that fixes my monitor
echo "Are past the alsonote script in noisemaker.sh at $(date)" >> log.txt
amixer -D pulse sset Master 45%
echo ""
echo Playing fly.wav!
echo ""
echo "pwd is $(pwd), User- make sure fly.wav is there."

echo "About to play the sound at $(date)" >> log.txt
killall java
killall minecraft-launcher
espeak "An alarm sound is about to start. This alarm will play once, only, and ... or ... will end when dismissed. It will never loop repeatedly."

for i in {1..5}; do sleep 0.4s && espeak "allow me to attempt to have even a small piece of personal independence in my entire life..." && sleep 0.4s; done

echo 0s && nohup paplay fly.wav && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown

echo "Played the sound at $(date)" >> log.txt

# Fluctuate brightness to alert me
flashing

echo 0s


# Fluctuate brightness to alert me
flashing

echo 0s


# Fluctuate brightness to alert me
flashing

# Fluctuate brightness to alert me
flashing

# Fluctuate brightness to alert me
flashing

echo ""
echo "Removing messy non-required nohup.out!"
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo "Popping kdialog!"
echo ""
echo "Waiting for kdialog to be dealt with (press OK or be closed), then we continue."
echo ""

echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid
echo 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; echo 1s ; kill -9 $pid


# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /



# m
echo 0.2s





echo 0.2s
# /

sleep 15s

# get this shit out of the way so i can press the button
killall update-manager
pkill update-manager
killall lubuntu-update
pkill lubuntu-update
killall update-notifier
pkill update-notifier

notify-send "Calendar event!"
echo "About to open kdialog $(date)" >> log.txt
echo 0s && nohup kdialog --msgbox "Calendar event! Hold escape for 30 moments to turn-off." && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out
kdialog --msgbox "Calendar event! Hold escape for 29 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 28 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 27 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 26 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 25 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 24 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 23 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 22 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 21 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 20 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 19 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 18 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 17 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 16 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 15 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 14 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 13 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 12 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 11 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 10 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 9 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 8 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 7 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 6 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 5 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 4 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 3 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 2 more moments to turn-off..."
kdialog --msgbox "Calendar event! Hold escape for 1 more moment to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 29 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 28 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 27 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 26 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 25 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 24 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 23 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 22 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 21 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 20 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 19 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 18 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 17 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 16 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 15 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 14 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 13 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 12 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 11 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 10 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 9 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 8 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 7 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 6 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 5 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 4 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 3 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 2 more moments to turn-off..."
kdialog --msgbox "Almost turned off! Hold escape for 1 more moment to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 29 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 28 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 27 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 26 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 25 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 24 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 23 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 22 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 21 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 20 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 19 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 18 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 17 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 16 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 15 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 14 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 13 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 12 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 11 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 10 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 9 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 8 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 7 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 6 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 5 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 4 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 3 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 2 more moments to turn-off..."
kdialog --msgbox "Shutting off! Hold escape for 1 more moment to turn-off..."
echo "User dealt with the kdialogs $(date)" >> log.txt
echo ""

sleep 1s
for i in {1..5}; do sleep 0.4s && notify-send "Note: Shave hands+face & clean glasses" && sleep 0.4s && notify-send "+ brush hair + fill bottle + dress + boots." && sleep 0.4s && notify-send " " && sleep 0.4s; done
sleep 1s
cd "$(dirname "$0")"
paplay $(pwd)/warning-beep.wav

espeak "The alarm has been shut-off."

sleep 0s && nohup kdialog --msgbox "Note: Shave hands+face & clean glasses + brush hair + fill bottle + dress + boots.\n \nIf you have some time, try consider everything you have done, that which you've achieved, and how far you've come, you deserve to appreciate your progress.\n \nTry to treat yourself with the love you deserve." && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""

rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo 0s
echo "Removing messy non-required nohup.out!"
echo ""

echo ""
pkill paplay
killall paplay
kill -9 $(pgrep paplay)
pkill aplay
killall aplay
kill -9 $(pgrep aplay)

# Amazing speech synthesis, this is.
echo 1s



echo 2s



echo 2s

echo 1s

echo 2s

# Open to-do list (uncomment and change path to where your to-do list in PDF form is)
#echo 0s && nohup atril /home/$(whoami)/Dropbox/Private-Novimatrem/my-stuff/docs/Schedule_Weekly_24_Hours_EDITED_300ppi_v20.pdf && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown

# Daily fortune
#TODAYFORT="$(fortune -a)"


echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo 0s
echo "Removing messy non-required nohup.out!"
echo ""

killall espeak
killall speech-dispatcher

echo "Exiting noisemaker at $(date)" >> log.txt

exit
