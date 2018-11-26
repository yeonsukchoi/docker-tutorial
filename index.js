var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('You did well!');
});

app.run(
  host=os.getenv('LISTEN', '0.0.0.0'),
  port=int(os.getenv('PORT','3000'))
  )

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
