cd "$(dirname "$0")"
echo "Hello from the internals of the alsoradio script is here $(date)" >> log.txt
sleep 160s
killall clementine
pkill clementine
shopt -s expand_aliases
sleep 0s && nohup clementine --play --volume 100 http://relay.slayradio.org:8000/ && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""
echo "Goodbye from the internals of the alsoradio script is here $(date)" >> log.txt
