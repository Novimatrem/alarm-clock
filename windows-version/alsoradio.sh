cd "$(dirname "$0")"
echo "Hello from the internals of the alsoradio script is here $(date)" >> log.txt
sleep 160s
nohup bash -c 'while true; do play -n synth 10 triangle 700 vol 0.9; sleep 10; done' >/dev/null 2>&1 &
killall clementine
pkill clementine
shopt -s expand_aliases
clementine --play --volume 100 http://relay.slayradio.org:8000/
pkill -9 -f "play -n synth"
echo "Goodbye from the internals of the alsoradio script is here $(date)" >> log.txt
