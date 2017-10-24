var date = new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '');
var gid = require("./gid");
console.log("Starting request @",date);
const speedTest = require('speedtest-net');
const test = speedTest({maxTime: 5000});
var GoogleSpreadsheet = require('google-spreadsheet');
var creds = require('./client_secret.json');
var doc = new GoogleSpreadsheet(gid);
test.on('data', data => {
  console.log("Received Answer from Speedtest @",date);
  doc.useServiceAccountAuth(creds, function (err) {
    if(err) return console.log(err);
    doc.addRow(1,{time:date,ping:data.server.ping,down:data.speeds.download,up:data.speeds.upload,server:data.server.sponsor},function(err){
      if(err) console.log(err);
      console.log("Adding to sheet @",date);
    });
  });
});

test.on('error', err => {
  console.error(err);
});
