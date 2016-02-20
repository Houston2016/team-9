var mysql = require("mysql");
function REST_ROUTER(router,connection,md5) {
	var self = this;
self.handleRoutes(router,connection,md5);



}

REST_ROUTER.prototype.handleRoutes=function(router,connection,md5) {
router.get("/",function(req,res){
	res.json({"Message" :"Hello world!"});
	})


router.get("/questions",function(req,res) {
	var query = "SELECT Questions,EngageID from ??";
	var table = ["Questions"];
	query = mysql.format(query,table);
	connection.query(query,function(err,rows) {
	if(err) {
		res.json({"Error": true, "Message" : "Error executing Mysql Query"});
	}else {
		res.json({"Error": false, "Message" : "Success","Questions": rows});
	}	


	});//end of connection	
	});//end of /questions route
router.post("/answers",function(req,res){

	var query = "INSERT INTO ??(??,??) VALUES (?,?)";
	var table = ["Answers","QuestionID","Ratings",req.QuestionID,req.Ratings];
	query = mysql.format(query,table);
	connection.query(query,function(err,rows) {
		if(err) {
			res.json({"Error": true, "Message": "Error Executing Mysql query"});
		}else {
		res.json({"Error" : false, "Message" :"Response received" });
		}
		
	});//end of connection function


});//end of post function
	


}


module.exports = REST_ROUTER;
