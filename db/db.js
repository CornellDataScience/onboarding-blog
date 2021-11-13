var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'cornellde',
  database: 'blog_db'
})

connection.connect()

// connection.query(`DROP TABLE users;`)
// connection.query(`DROP TABLE blogs;`)

connection.query(`CREATE TABLE users(
  id INT,
  name VARCHAR(255),
  PRIMARY KEY(id)
  );`, function (err, rows, fields) {
  if (err) throw err
  console.log(err)
})

connection.query(`CREATE TABLE blogs(
  id INT,
  author_id INT,
  date DATETIME,
  title VARCHAR(255),
  content LONGTEXT,
  PRIMARY KEY(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
  );`, function (err, rows, fields) {
  if (err) throw err
  console.log(err)
})

connection.end()