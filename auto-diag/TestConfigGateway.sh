#!/bin/bash

shortDescription="Test Config Passerelle"

ipPasserelle=$(ip route | grep default | egrep -o '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}')

if [ -z "${ipPasserelle}" ]
then
	echo "${shortDescription} ko  "
	exit 1
else
	echo "${shortDescription} ok  "
	exit 0
fi
