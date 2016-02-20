//This is a server to accept connections from a web app/iOS App
var express = require('express');
var app =  express();
var mysql = require('mysql');
var bodyParser = require('body-parser');
var rest = require("./REST.js");
var md5 = require('MD5');
function REST(){
	var self = this;
	self.connectMysql();

};

REST.prototype.connectMysql = function() {

	var self = this;
	var pool = mysql.createPool( {
		connectionLimit: 100,
		host : 'localhost',
		user : 'root',
		password : 'password',
		database : 'NCENTERS',
		debug : false



	});//end of connectionPool
	pool.getConnection(function(err,connection) {
		if(err) {
			self.stop(err);
		}else{
			self.configureExpress(connection);
		}

	});

}//end of function

REST.prototype.configureExpress = function(connection) {
	var self = this;
	app.use(bodyParser.urlencoded({extended: true }));
	app.use(bodyParser.json());
	var router = express.Router();
	app.use('/api',router);
	var rest_router = new rest(router,connection,md5);
	self.startServer();
}
REST.prototype.startServer = function() {
	app.listen(3001,function() {
		console.log("All right, Server is on listening on port 3000");
	});
	

}
REST.prototype.stop = function(err) {
	console.log("Mysql connection error" +err);
	process.exit(1);

}

new REST();


//var connection = mysql.createConnection({
//	host : 'localhost',
//	user : 'root',
//	password : 'password'
//});
// A comment
//app.use(bodyParser.urlencoded({
//	extended: true
//}));


//app.get('/',function(req,res) {
//	res.sendfile(_dirname + '/index.html');
//});

//app.post('/questions',function(req,res) {
//	connection.query('INSERT INTO QUESTIONS SET ?',req.body,
//		function(err, result) {
//		if(err) throw err;
//		res.send('Question added to the database with ID: ' + result.insertID);
//
//		}	
//	);
//});



app.listen(3000);
//console.log("Express server Listening on port %d in %s mode", app.address().port,app.settings.env);
