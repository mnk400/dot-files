#!/bin/bash
HOST='squishypi.lan'
PATHTODOC='/home/manik/NAS/Documents'
PATHTOPICS='/home/manik/NAS/Photos'
#Checking if connected to the NAS
if ping -q -c 1 -W 1 $HOST >/dev/null; 
then	
	echo "$HOST online, checking if mounted"
	
	#Checking if the path to NAS exists, i.e. if it's mounted
	if [ -d $PATHTODOC ] 
	then
		    echo "NAS mounted" 
	else
		    echo "Error: NAS not mounted"
		    mount -a
	fi
	
	echo "Running rsync"
	echo "Syncing Documents"
	rsync -rtvu --delete /home/manik/Manik/Drive/Documents/ $PATHTODOC
	echo "Syncing Photos"
	rsync -rtvu --delete /home/manik/Manik/Pictures $PATHTOPICS
else
	#Quitting if not host not found online
	echo "$HOST not Found, can't sync. Quitting."
fi

