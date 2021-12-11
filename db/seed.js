function escapeDoubleQuotes(str) {
  return str.replace(/\\([\s\S])|(")/g, "\\$1$2");
}

axios
  .post("https://api.github.com/markdown", {
    text: `
  * this one
  * that one
  * the other one
  Note that --- not considering the asterisk --- the actual text
  content starts at 4-columns in.
  
  > Block quotes are
  > written like so.
  >
  > They can span multiple paragraphs,
  > if you like.

  "quotes"`,
  })
  .then((res) => {
    var sql = `INSERT INTO posts (author_id, date, title, content) VALUES (1, "2018/11/13", "Blog title", "${escapeDoubleQuotes(
      res.data
    )}")`;
    connection.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
    });
  })
  .catch((error) => {
    console.error(error);
  });
