var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('고생했어..');
});


app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
