#!/bin/bash

printf "\nPlug in your idevice and enter your passcode.\n"
printf "=============================================\n"
while ! idevicepair pair; do
  sleep 1s
done

# Get udid
udid=$(idevice_id | awk '{print $1}')
read -p "Enter your Apple ID: " appleId
read -sp "Enter your password: " pass
printf "\nInstalling ${sonolus} \n"
printf "=============================================\n"
./AltServer -u $udid -a $appleId -p $pass $sonolus