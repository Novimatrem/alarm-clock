cd "$(dirname "$0")"
sleep 160s
killall vlc
pkill vlc
shopt -s expand_aliases
vlc --qt-start-minimized http://relay.slayradio.org:8000/
