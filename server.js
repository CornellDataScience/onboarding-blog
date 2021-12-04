const http = require("http");
const express = require("express");
const path = require("path");
const axios = require("axios");
const mysql = require("mysql");

const app = express();
app.use(express.json());
app.use(express.static(__dirname + "/public"));

// Custom imports
const indexScripts = require("./public/js/index.js");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "cornellde",
  database: "blog_db",
});

// Use EJS for our engine to render pages
app.set("view engine", "ejs");

// default URL for website
// index page
app.get("/", function (req, res) {
  let posts;
  let users;
  connection.query(
    "SELECT * FROM posts ORDER BY date DESC",
    function (err, db_posts, fields) {
      if (err) throw err;
      posts = db_posts;
      connection.query("SELECT * FROM users", function (err, db_users, fields) {
        if (err) throw err;
        users = db_users;

        console.log(posts);
        console.log(users);
        res.render("pages/index", {
          posts: posts,
          users: users,
          utils: indexScripts,
        });
      });
    }
  );
});

app.get("/post/:id", function (req, res) {
  connection.query(
    `SELECT * FROM posts WHERE id = ${req.params.id}`,
    function (err, posts) {
      if (err) throw err;
      res.render("pages/blog", {
        post: posts[0],
      });
    }
  );
});

const server = http.createServer(app);
let port = process.env.PORT || 3000;
server.listen(port);
console.debug("Server listening on port " + port);
