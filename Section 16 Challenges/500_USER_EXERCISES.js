var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});

// Challenge 1

var q1 = 'SELECT DATE_FORMAT(created_at, "%M %D %Y") AS earliest_date FROM users ORDER BY created_at LIMIT 1';

connection.query(q1, function (error, results, fields) {
	if (error) throw error;
	console.log(results[0])
});

// Challenge 2

var q2 = 'SELECT email, created_at FROM users WHERE created_at = (SELECT MIN(created_at) FROM users)';

connection.query(q2, function (error, results, fields) {
	if (error) throw error;
	console.log(results[0]);
});

// Challenge 3

var q3 = 'SELECT MONTHNAME(created_at) AS month, COUNT(email) AS count FROM users GROUP BY month ORDER BY count DESC';

connection.query(q3, function (error, results, fields) {
	if (error) throw error;
	console.log(results);
});

// Challenge 4

var q4 = 'SELECT COUNT(email) AS yahoo_users FROM users WHERE email LIKE "%@yahoo.com" ';

connection.query(q4, function (error, results, fields) {
	if (error) throw error;
	console.log(results);
});

// Challenge 5

var q5 = 'SELECT CASE WHEN email LIKE "%@gmail.com" THEN "gmail" WHEN email LIKE "%@yahoo.com" THEN "yahoo" WHEN email LIKE "%@hotmail.com" THEN "hotmail" ELSE "other" END AS provider, COUNT(*) AS total_users FROM users GROUP BY provider'

connection.query(q5, function(error, results, fields) {
	if(error) throw error;
	console.log(results)
});

connection.end();