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

// index page
app.get("/", function (req, res) {
  let posts = [
    {
      title: "Optimal Classification Trees Paper Summary & Analysis",
      subtitle:
        "Paper: https://link.springer.com/article/10.1007/s10994-017-5633-9\nDiscussion led by Peter Husisian & Julia Allen, Intelligent Systems Subteam",
      content: "Example blog post content!\nHello World",
    },
    {
      title:
        "Do Better ImageNet Models Transfer Better? Paper Summary & Analysis",
      subtitle:
        "Paper: https://openaccess.thecvf.com/content_CVPR_2019/papers/Kornblith_Do_Better_ImageNet_Models_Transfer_Better_CVPR_2019_paper.pdf\nDiscussion led by Stephen Tse & Felix Hohne, Intelligent Systems Subteam",
      content: "Example blog post content numero 2!\nHello World 2",
    },
  ];

  res.render("pages/index", {
    posts: posts,
  });
});

const server = http.createServer(app);
const port = 3000;
server.listen(port);
console.debug("Server listening on port " + port);
