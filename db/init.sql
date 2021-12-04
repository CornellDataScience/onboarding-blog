DROP DATABASE IF EXISTS blog_db;
CREATE DATABASE blog_db;
USE blog_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  author_id INT NOT NULL,
  date DATE NOT NULL,
  title VARCHAR(255) NOT NULL,
  subtitle LONGTEXT NOT NULL,
  paper LONGTEXT NOT NULL,
  content LONGTEXT NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id)
);

INSERT INTO users (name)
VALUES ("David Kim");INSERT INTO users (name)
VALUES ("David Kim");

INSERT INTO posts (author_id, date, title, subtitle, paper, content) 
VALUES (
  1, 
  "2021-10-20", 
  "Example blog post title", 
  "Example blog post subtitle", 
  "http://www.africau.edu/images/default/sample.pdf", 
  "Lorem Ipsum asdf asdf asdf asdf"
);

INSERT INTO users (name)
VALUES ("Immanuel Trummer");

INSERT INTO posts (author_id, date, title, subtitle, paper, content) 
VALUES (
  1, 
  "2019-11-16", 
  "SkinnerDB: Regret-Bounded Query Evaluation via Reinforcement Learning", 
  "Cited by 59", 
  "https://dl.acm.org/doi/pdf/10.1145/3299869.3300088", 
  "SkinnerDB is designed from the ground up for reliable join ordering. It maintains no data statistics and uses no cost or cardinality models. Instead, it uses reinforcement learning to learn optimal join orders on the fly, during the execution of the current query. To that purpose, we divide the execution of a query into many small time slices. Different join orders are tried in different time slices. We merge result tuples generated according to different join orders until a complete result is obtained. By measuring execution progress per time slice, we identify promising join orders as execution proceeds. Along with SkinnerDB, we introduce a new quality criterion for query execution strategies. We compare expected execution cost against execution cost for an optimal join order. SkinnerDB features multiple execution strategies that are optimized for that criterion. Some of them can be executed on top of existing database systems. For maximal performance, we introduce a customized execution engine, facilitating fast join order switching via specialized multi-way join algorithms and tuple representations. We experimentally compare SkinnerDB's performance against various baselines, including MonetDB, Postgres, and adaptive processing methods. We consider various benchmarks, including the join order benchmark and TPC-H variants with user-defined functions. Overall, the overheads of reliable join ordering are negligible compared to the performance impact of the occasional, catastrophic join order choice."
);