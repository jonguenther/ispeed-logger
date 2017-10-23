# wifilogger
Log your Wifi/Internet speed into Google Sheets

## Requirements
Following components are needed to run the wifilogger:
- Nodejs
- some Linux device to run Nodejs on (e.g. Raspberry PI)

## Installation

1. Copy [this sheet](https://somelink) into your Google Drive
1. Go to [Google Console](https://console.cloud.google.com/) and create a new project
1. Search for `Google Drive API` and click on the suggested Link
1. Enable the API
1. Click on `create credentials` and configure the API as followed: <br>![picture](https://i.imgur.com/PGKwmou.png) <br>After creating your credentials, you'll be prompted to download a JSON file containing the credentials.
1. Log into your Linux device and create a new folder where you want to run wifilogger in and do `git clone https://github.com/jonguenther/wifilogger.git [YOURFOLDERNAME]`
1. go into your folder and run `npm install`
1. Copy the downloaded JSON file into the folder and rename it to `credentials.js`.
1. With your favorite editor, open the JSON file and change the table value to the ID of your copied Google Sheet(the long mysterious string in the URL).
1. Copy the ID of the user in the `credentials.js` and add it as editor to your Google Sheet.
1. Run `crontab -e`

# WORK IN PROGRESS
