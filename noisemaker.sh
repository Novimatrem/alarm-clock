#!/bin/bash

# Novimatrem's alarm clock script, for the waking up. - Licensed under the GNU GPL v3.0.
# (epilepsy warning)
# REQUIRES and DEPENDS UPON zenity, espeak, paplay, bash, and a working 'fortune' command.
# The alarm currently triggers at 10am by default and there is no simple way to adjust this outside of editing the bash scripts manually in multiple places, at the moment.

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

# Final check, for accuracy.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEHOURTIMEKEEPING="$(echo 06)"
#TIMEMINUTETIMEKEEPING="$(echo 59)"

if ! [ "$TIMEHOURTIMEKEEPING" == "06" ]; then exit; fi
if ! [ "$TIMEMINUTETIMEKEEPING" == "59" ]; then exit; fi

# Try to account for delays, to start making noise at exactly 10:00:00 AM
sleep 45s
sleep 8s

# This sleep is "college-protection", to avoid the alarm running in class IF I'd already woken up after 7 AM, before 10 AM.
sleep 10800s # It waits 3 hours in seconds, from when the start is made at 7 AM. For a final wake time of 10AM, else, doesn't run

# Switch sound device to the speakers so I can actually hear the alarm clock
pacmd set-default-sink "alsa_output.pci-0000_01_00.1.hdmi-stereo"
sleep 4s

# Unmute the speakers
amixer set Master unmute

# Speaker warming
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Speaker warming 2
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Set volume to reasonable percentage to wake me up, but not to deafen the neighborhood
echo ""
echo "Speaker volume to 100%!"
echo ""
amixer -D pulse sset Master 100%

function flashing {
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.01
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.1
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.1
}

# Fluctuate brightness to alert me
flashing

# Play fly.wav with paplay
echo ""
echo Playing fly.wav!
echo ""
echo "pwd is $(pwd), User- make sure fly.wav is there."
paplay --volume=67036 $(pwd)/fly.wav &
espeak -p 66 -s 200 ". ... ."
espeak -p 66 -s 150 "Wake up... . ... . "

# Fluctuate brightness to alert me
flashing

sleep 0s
espeak -p 66 -s 150 "Wake up... . ... . "

# Fluctuate brightness to alert me
flashing

sleep 0s
espeak -p 66 -s 150 "Wake up... . ... . "

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
echo "Popping zenity!"
echo ""
echo "Waiting for zenity to be dealt with (press OK or be closed), then we continue."
echo ""
notify-send "Wake up!"
sleep 0s && nohup zenity --warning --text "Wake up!" && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""
echo "Killing paplay HARD to stop fly.wav."
echo ""
pkill paplay
killall paplay
kill -9 $(pgrep paplay)

# Amazing speech synthesis, this is.
sleep 1s
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s
espeak -p 66 -s 200 ". ... ."
paplay $(pwd)/silence.wav
sleep 2s
espeak "Good morning! . ... . ...remember to check your to do list. . ... . ..."
sleep 1s
espeak "It's $(date +”%A”)"
sleep 2s


# Daily fortune
TODAYFORT="$(fortune)"
nohup zenity --warning --text "$(echo $TODAYFORT)" & nohup espeak -p 66 -s 150 -g 3 "$(echo $TODAYFORT)"

echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""

killall espeak
killall speech-dispatcher

exit