var mysql = require('mysql');
const { resourceLimits } = require("worker_threads");
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'blog_db'
})

const http = require("http");
const express = require("express");
const path = require("path");
const app = express();

app.use(express.json());
app.use(express.static(__dirname + "/public"));

// Use EJS for our engine to render pages
app.set("view engine", "ejs");

// default URL for website
// app.use("/", function (req, res) {
// res.sendFile(path.join(__dirname + "/pages/index"));
// });

connection.connect();
// index page
app.get("/", function (req, res) {
  // let posts = [];
    connection.query("SELECT * FROM blogs", function (err, posts, fields) {
      if (err) throw err;

      console.log(posts);
      res.render("pages/index", {
        posts: posts,
      });
    });
});

app.get("/blog", function (req, res) {
  let title = "Optimal Classification Trees Paper Summary & Analysis";
  let author = "Cornell Data Science";
  let date = "October 22, 2021";
  let posts = [
    {
      heading: "Paper Objective",
      content: `A decision tree is a flowchart-like structure where every node represents a 
      “test” on an attribute, each branch represents the outcome of a test, and each 
      leaf node represents a class label, or the decision taken after considering 
      all attributes. Because they are created using a top-down approach, the first 
      splits are made with no regard to future splits, meaning they are rarely 
      optimal. To address this, a pruning step is required after creating the tree. 
      Optimizing decision trees is NP-hard, meaning that it has not been very 
      explored before. This paper uses mixed integer optimization to optimize the 
      tree, a technique that is an integer program, with one or more variables 
      constrained as integers.

      MIO programming was computationally expensive in the past, but solvers 
      such as Gurobi and CPLEX have improved greatly over the last decade or 
      two, meaning MIO is more useful than ever.`,
    },
    {
      heading: "Paper Contributions",
      content: `The authors, motivated by rapid development of optimization theory and 
      hardware improvements, present an algorithm that utilizes mixed-integer 
      optimization (a linear program in which 1 or more of the variables are 
      constrained to be integers).
      The researchers revisited the classical optimal decision tree creation 
      problem using the state-of-the-art MIO formulation approach.
      Previously, to find an optimal decision tree, the most common approach 
      is through heuristics such as top down induction and pruning, and no 
      effective algorithm that runs within time constraint is proposed.
      By relaxing constraints, the resulting classification method — Optimal 
      Classification Trees with hyperplanes — is easy to train.
      The paper assessed its results on a variety of synthetically-generated 
      datasets by comparing the performance of optimal axis-aligned trees with 
      normal decision trees, the performance of linear-split optimal decision 
      trees with XGBoost and random forest. They used accuracy as their metric 
      of comparison.`,
    },
  ];
  res.render("pages/blog", {
    title: title,
    author: author,
    date: date,
    posts: posts,
  });
});


const server = http.createServer(app);
let port = process.env.PORT || 3000;
server.listen(port);
console.debug("Server listening on port " + port);
