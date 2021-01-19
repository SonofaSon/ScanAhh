#!/bin/bash

if [ "$1" == "" ]
then
	echo "Please input a Target."
	echo "Ex ==> ./ScanAhh.sh [Insert Target IP Here]"

else
	open_ports=$(nmap -T4 -p- $1 | grep "open" | cut -d "/" -f 1 | tr '\n' ', ')  #Grabs Open Port #'s and adds to an array
fi

if [ "$open_ports" == "" ]
then
	echo "No ports are open :("

else
	nmap -T4 -p $open_ports -A $1 -oN agressive-info.txt  #Prints agressive scan to a text file	
fi





