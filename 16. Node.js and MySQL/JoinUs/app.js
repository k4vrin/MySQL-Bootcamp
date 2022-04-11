var express = require('express');
var mysql = require('mysql');
var bodyParser  = require("body-parser");
var app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	database : 'join_us'
});

app.get("/", function(req, res){
	
	// Find total users in db
	var q = 'SELECT COUNT(*) AS total From users';
	connection.query(q, function (error, results, fields) {
		if (error) throw error;
		
		var total_users = results[0].total;
		// Respond with ejs
		res.render("home", {data: total_users});
	});
});

app.post("/register", function(req, res){
	var person = {email: req.body.email};
	
	connection.query('INSERT INTO users SET ?', person, function(err, result) {
		if (err) throw err;
		res.redirect("/")
	});
});

app.get("/joke", function(req, res){
	var joke = "<strong>What do you call a dog that does magic tricks?</strong> <em>A labracadabrador.</em>";
	res.send(joke);
});

app.get("/random_num", function(req, res){
	var num = Math.floor((Math.random() * 10) + 1);
	res.send("Your lucky number is " + num);
});


app.listen(3000, function () {
  console.log('App listening on port 3000!');
});
