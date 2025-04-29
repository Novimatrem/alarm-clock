cd "$(dirname "$0")"
sleep 160s
killall clementine
pkill clementine
shopt -s expand_aliases
clementine --play --volume 100 http://relay.slayradio.org:8000/
