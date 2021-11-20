const http = require("http");
const express = require("express");
const path = require("path");
const app = express();

app.use(express.json());
app.use(express.static(__dirname + "/public"));

var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'cornellde',
  database: 'blog_db'
})

const axios = require('axios')

// Use EJS for our engine to render pages
app.set("view engine", "ejs");

// default URL for website
// index page
app.get("/", function (req, res) {
  connection.query(`SELECT * FROM blogs`, function (err, posts) {
    if (err) throw err;
    res.render("pages/index", {
      posts: posts,
    });
  });
});

app.get("/blog/:id", function (req, res) {
  connection.query(`SELECT * FROM blogs WHERE id = ${req.params.id}`, function (err, posts) {
    if (err) throw err;
    res.render("pages/blog", {
      post: posts[0],
    });
  });
});



const server = http.createServer(app);
let port = process.env.PORT || 3000;
server.listen(port);
console.debug("Server listening on port " + port);
