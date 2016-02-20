//This is a server to accept connections from a web app/iOS App
var express = require('express');
var app =  express();
var mysql = require('mysql');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'password'
});
// A comment
app.use(bodyParser.urlencoded({
	extended: true
}));


app.get('/',function(req,res) {
	res.sendfile(_dirname + '/index.html');
});

app.post('/questions',function(req,res) {
	connection.query('INSERT INTO QUESTIONS SET ?',req.body,
		function(err, result) {
		if(err) throw err;
		res.send('Question added to the database with ID: ' + result.insertID);

		}	
	);
});



app.listen(3000);
//console.log("Express server Listening on port %d in %s mode", app.address().port,app.settings.env);
