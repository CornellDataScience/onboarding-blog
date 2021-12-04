var mysql = require("mysql");
var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "blog_db",
});

connection.connect();

// connection.query(`DROP TABLE users;`)
// connection.query(`DROP TABLE blogs;`)

// connection.query(
//   ``,
//   function (err, rows, fields) {
//     if (err) throw err;
//     console.log(err);
//   }
// );

connection.end();
