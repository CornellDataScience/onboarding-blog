var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'cornellde',
  database: 'blog_db'
})

connection.connect()

// connection.query(`DROP TABLE blogs;`)
// connection.query(`DROP TABLE users;`)

connection.query(`CREATE TABLE IF NOT EXISTS users(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
  );`, function (err, rows, fields) {
  if (err) throw err
})

connection.query(`CREATE TABLE IF NOT EXISTS blogs(
  id INT NOT NULL AUTO_INCREMENT,
  author_id INT NOT NULL,
  date DATETIME NOT NULL,
  title VARCHAR(255) NOT NULL,
  content LONGTEXT NOT NULL, 
  PRIMARY KEY(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
  );`, function (err, rows, fields) {
  if (err) throw err
})

connection.end()