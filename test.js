var gid = require("./gid");
gid = gid();
var GoogleSpreadsheet = require('google-spreadsheet');
var creds = require('./client_secret.json');
var doc = new GoogleSpreadsheet(gid);
doc.useServiceAccountAuth(creds, function (err) {
        if(err) return console.log("error",err);
        doc.getRows(1,function(err,rows){
                if(err) return console.log("error",err);
                console.log("ok");
        });
});
