#!/usr/bin/env bash

if ! command -v railway &> /dev/null
then
  echo "railway CLI could not be found, is it installed?"
  echo "https://docs.railway.app/develop/cli#installation"
  exit
fi

if ps aux | grep "[r]ailway logs" &> /dev/null
then
  while true; do
    read -p "Logs are already being saved, you you like to stop logging? " yn
    case $yn in
      [Yy]* ) kill $(ps aux | grep "[r]ailway logs" | awk '{print $2}'); exit;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
    esac
  done
fi

echo "Path to project?"
read PROJPATH
cd "$PROJPATH"
railway logs -d > deploy.log &
echo "Deployment logs being saved to $PROJPATH/deploy.log"
