#!/bin/bash

sonolus="Sonolus_0.7.5_1.ipa"

printf "\nPlug in your idevice and enter your passcode.\n"
printf "=============================================\n"
while ! idevicepair pair; do
  sleep 1s
done

# Get Sonolus ipa
printf "\nDownloading ${sonolus} \n"
printf "=============================================\n"
curl -#O "https://download.sonolus.com/${sonolus}"

# Get udid
udid=$(idevice_id | awk '{print $1}')
printf "\nInstalling ${sonolus} \n"
printf "=============================================\n"
read -p "Enter your Apple ID: " appleId
read -sp "Enter your password: " pass
./AltServer -u $udid -a $appleId -p $pass $sonolus