var mysql = require("mysql");
// var connection = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "password",
//   database: "blog_db",
// });
// var connection = mysql.createConnection(process.env.JAWSDB_URL);
var connection;
if (process.env.JAWSDB_URL) {
  connection = mysql.createConnection(process.env.JAWSDB_URL);
} else {
  connection = mysql.createConnection({
    host: "uzb4o9e2oe257glt.cbetxkdyhwsb.us-east-1.rds.amazonaws.com",
    user: "hnegdidotbrxz9cw",
    password: "v81k0tcwfsxigeoz",
    port: 3306,
    database: "zjv41srf1j2d4ppz",
  });
}

connection.connect();

// connection.query(`DROP TABLE blogs;`)
// connection.query(`DROP TABLE users;`)

// connection.query(`CREATE TABLE users(
//   id INT AUTO_INCREMENT PRIMARY KEY,
//   name VARCHAR(255) NOT NULL
//   );`, function (err, rows, fields) {
//   if (err) throw err
// })

// connection.query(`CREATE TABLE blogs(
//   id INT AUTO_INCREMENT PRIMARY KEY,
//   author_id INT NOT NULL,
//   date DATE NOT NULL,
//   title VARCHAR(255) NOT NULL,
//   subtitle LONGTEXT NOT NULL,
//   paper LONGTEXT NOT NULL,
//   content LONGTEXT NOT NULL,
//   FOREIGN KEY(author_id) REFERENCES users(id)
//   );`, function (err, rows, fields) {
//   if (err) throw err
// })

connection.end();
