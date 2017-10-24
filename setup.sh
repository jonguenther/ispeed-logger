#!/bin/bash
clear

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NODE="$(which node)"
echo " _ _____                     _"
echo "(_)  ___|                   | |"
echo " _\ \`--. _ __   ___  ___  __| |"
echo "| |\`--. \\ \\'_\\ / _ \\/ _ \\/ _\` |"
echo "| /\__/ / |_) |  __/  __/ (_| |"
echo "|_\____/| .__/ \___|\___|\__,_|"
echo "      | |"
echo "      |_| Logger"
echo "(c) Jonathan Guenther 2017"
echo "v0.0.1"
printf "\n"
echo "USE AT YOUR OWN RISK!"
printf "-------------------------------\n"
echo "checking if setup already run"

if [ -z "$NODE" ]
then
  echo "Couldn't find NodeJS! Please check your setup before you continue!"
  exit 1
fi

if [ -d $DIR/node_modules ]
then
  echo "node_folder found!"
  if npm ls | grep -q google-spreadsheet && npm ls | grep -q speedtest-net; then
    echo "required modules found!"
  else
    echo "couldn't find required dependencies"
    while true; do
      read -p "Do you wish to install them now?" yn
      case $yn in
          [Yy]* ) npm install; break;;
          [Nn]* ) echo "cannot continue without dependencies!";exit;;
          * ) echo "Please answer yes or no.";;
      esac
    done
  fi
else
  echo "couldn't find required dependencies"
  while true; do
    read -p "Do you wish to install them now? " yn
    case $yn in
        [Yy]* ) npm install; break;;
        [Nn]* ) echo "cannot continue without dependencies!";exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi
echo "-------------------------------\n"
if [ -e $DIR/client_secret.json ]
then
  echo "client_secret.json already exists, skipping step"
else
  while true; do
    read -p 'Please state the ABSOLUTE location of your credentials JSON > ' cred
    echo $cred
    cp $cred $DIR/client_secret.json && break|| echo "Error while reading file! Please try again!"
  done
fi
echo "\n"
read -p "Please enter your Google Sheets ID(Or leave empty to skip) >" gid
if [ ! $gid = "" ]
then
  sed -i "2s/.*/return '$gid';/" $DIR/gid.js
else
  echo "skipping Step"
fi
printf "-------------------------------\n"
echo "checking connection"
CHECK="$($NODE $DIR/test.js)"
if [[ $CHECK == "error"* ]]
then
  echo "Couldn't establish connection."
  printf "Reason:\n %s" "$CHECK"
  echo "Please check your setup and restart this script."
  exit 1
else
  printf "Connection successfully established!"
  rm $DIR/test.js
fi
printf "-------------------------------\n"
while true; do
  read -p "Do you wish to install as a cronjob? " yn
  case $yn in
      [Yy]* ) crontab -l | { cat; echo "*/5 * * * * $NODE $DIR/app.js"; } | crontab -; echo "Script is now live!";break;;
      [Nn]* ) echo "Not adding to cronjob.";exit;;
      * ) echo "Please answer yes or no.";;
  esac
done
printf "\n"
echo "Thanks for using this script."
