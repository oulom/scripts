#!/bin/bash

shortDescription="Test Ping Passerelle"

ipPasserelle=$(ip route | grep "default" | egrep -o '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}'  )

if [ -z "${ipPasserelle}" ]
then
	echo "${shortDescription} ko  "
	exit 2
else
	ping -c 2 "${ipPasserelle}" 2>&1 1>/dev/null
	if [ $? -ne 0 ]
	then
		echo "${shortDescription} ko  "
		exit 1
	else
		echo "${shortDescription} ok  "
		exit 0
	fi
fi
