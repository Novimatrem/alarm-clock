cd "$(dirname "$0")"
sleep 160s
killall vlc
pkill vlc
shopt -s expand_aliases
alias slayradio='echo "Playing SLAY Radio (slayradio.org);" && vlc --qt-start-minimized http://relay.slayradio.org:8000/ 2> /dev/null && disown 2> /dev/null & disown 2> /dev/null && clear && echo "Playing SLAY Radio (slayradio.org)"'
slayradio
