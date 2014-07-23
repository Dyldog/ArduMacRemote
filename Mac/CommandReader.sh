#!/bin/bash
DEBUG=0
COMMANDS=( 
"16711935:osascript -e 'tell application \"System Events\" to keystroke \"q\" using command down'" #Eject
"16764975:osascript -e 'tell application \"System Events\" to key code 53'" #Menu
"16773135:osascript -e 'tell application \"System Events\" to keystroke tab using command down'" #Angle
"16756815:open /Applications/Plex\ Home\ Theater.app" #1
"16748655:open /Applications/Safari.app" #2
"16736415:osascript -e 'tell application \"System Events\" to key code 52'" #Middle
"16712445:osascript -e 'tell application \"System Events\" to key code 124'" #Right
"16724685:osascript -e 'tell application \"System Events\" to key code 123'" #Left
"16716525:osascript -e 'tell application \"System Events\" to key code 125'" #Down
"16720605:osascript -e 'tell application \"System Events\" to key code 126'" #Up
         )

##To Add
#Casa Sites
	#Transmission
	#Headphones
	#SabNZBD
	#SickBeard
	#CouchPotato

COMMAND_FOUND=0
COMMAND_VAL=`echo "${1%?}"`
for command in "${COMMANDS[@]}" ; do
    KEY="${command%%:*}"
    VALUE="${command##*:}"

    if [ "$KEY" == "$COMMAND_VAL" ]; then 
    	eval $VALUE
		
		COMMAND_FOUND=1;
	fi
done

#echo $1;

if [ $COMMAND_FOUND = 0 ]; then
	if [[ $DEBUG = 1 ]]; then
		say "No command set for this button"
		sed "4i\ 
		\"$COMMAND_VAL:say No command set for this button\"
		" $0 > /tmp/RemoteApp.sh
		rm $0;
		mv /tmp/RemoteApp.sh $0
		chmod +x $0
	fi
fi
