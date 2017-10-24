# iSpeed-Logger
Log your Internet speed automatically into Google Sheets.

## Requirements
Following components are needed to run the ispeed-logger:
- Nodejs
- some Linux device to run Nodejs on (e.g. Raspberry PI)
- An Internet connection

## Features
- Online accessable speed log
- Graphically displayed
- Sharable with friends and collegues
- You can export the graph

## Installation
1. Copy [this sheet](https://goo.gl/qFZcZF) into your Google Drive and copy it's ID(the long string after /d/ in the url like `18azssZh4_dLdbOJR6wQSVgQQrx9CUCVNRED9aPY_qDI`)
1. Go to [Google Console](https://console.cloud.google.com/) and create a new project
1. Search for `Google Drive API` and click on the suggested Link
1. Enable the Google Drive API
1. Click on `create credentials` and configure the API as followed: <br>![picture](https://i.imgur.com/PGKwmou.png) <br>After creating your credentials, you'll be prompted to download a JSON file containing the credentials.
1. Log into your Linux device and create a new folder where you want to run wifilogger in and do `git clone https://github.com/jonguenther/wifilogger.git [YOURFOLDERNAME]`
1. go into your folder and run `setup.sh` and follow the instructions

## Tips
- Run the script as root / sudo user

If you encounter any problems, please report them.

*Be aware, that you use the script at your own risk!*
