cd "$(dirname "$0")"
echo "Hello from the internals of the alsonote script is here $(date)" >> log.txt
sleep 80s

shopt -s expand_aliases

sleep 0s && nohup kdialog --msgbox "Note: Shave hands+face & clean glasses + brush hair + fill bottle + dress + boots.\n \nIf you have some time, try consider everything you have done, that which you've achieved, and how far you've come, you deserve to appreciate your progress.\n \nTry to treat yourself with the love you deserve." && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""

echo "Goodbye from the internals of the alsonote script is here $(date)" >> log.txt
