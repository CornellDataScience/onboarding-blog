var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'blog_db'
})

connection.connect()

// connection.query(`DROP TABLE users;`)
// connection.query(`DROP TABLE blogs;`)

connection.query(`CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
  );`, function (err, rows, fields) {
  if (err) throw err
  console.log(err)
})

connection.query(`CREATE TABLE blogs(
  id INT AUTO_INCREMENT PRIMARY KEY,
  author_id INT NOT NULL,
  date DATE NOT NULL,
  title VARCHAR(255) NOT NULL,
  subtitle LONGTEXT NOT NULL,
  paper LONGTEXT NOT NULL,
  content LONGTEXT NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id)
  );`, function (err, rows, fields) {
  if (err) throw err
  console.log(err)
})

connection.end()