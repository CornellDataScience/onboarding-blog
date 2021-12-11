-- DROP DATABASE IF EXISTS blog_db;
-- CREATE DATABASE blog_db;
-- USE blog_db;
USE zjv41srf1j2d4ppz;

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

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
  2, 
  "2019-11-16", 
  "SkinnerDB: Regret-Bounded Query Evaluation via Reinforcement Learning", 
  "Cited by 59", 
  "https://dl.acm.org/doi/pdf/10.1145/3299869.3300088", 
  "SkinnerDB is designed from the ground up for reliable join ordering. It maintains no data statistics and uses no cost or cardinality models. Instead, it uses reinforcement learning to learn optimal join orders on the fly, during the execution of the current query. To that purpose, we divide the execution of a query into many small time slices. Different join orders are tried in different time slices. We merge result tuples generated according to different join orders until a complete result is obtained. By measuring execution progress per time slice, we identify promising join orders as execution proceeds. Along with SkinnerDB, we introduce a new quality criterion for query execution strategies. We compare expected execution cost against execution cost for an optimal join order. SkinnerDB features multiple execution strategies that are optimized for that criterion. Some of them can be executed on top of existing database systems. For maximal performance, we introduce a customized execution engine, facilitating fast join order switching via specialized multi-way join algorithms and tuple representations. We experimentally compare SkinnerDB's performance against various baselines, including MonetDB, Postgres, and adaptive processing methods. We consider various benchmarks, including the join order benchmark and TPC-H variants with user-defined functions. Overall, the overheads of reliable join ordering are negligible compared to the performance impact of the occasional, catastrophic join order choice."
);

INSERT INTO users (name)
VALUES ("Imani Finkley & Rahma Tasnim");

INSERT INTO posts (author_id, date, title, subtitle, paper, content) 
VALUES (
  3, 
  "2021-12-06", 
  "Bias in ML: An Introduction", 
  "205 Claps", 
  "https://cornell-data.medium.com/bias-in-ml-an-introduction-d74b8432ecf2", 
  "Let’s face it: whether it’s a recommended song on Spotify or that ad for a trip to the Bahamas that pops up just when you are ready for vacation, algorithms are making decisions about our lives everyday. And now, they have even entered the hiring process.
In response to the pandemic, companies like Uber and Postmates started using Checkr, an AI-powered background check, in their interview process. Checkr scans resumes, analyzes facial expressions during video interviews, compares criminal records, and judges social media behavior. Algorithms like Checkr are used in an effort to streamline the hiring process and eliminate any prejudice a human being might have when hiring. While Checkr’s goal is to ensure that “all candidates deserve a fair chance to work,” there are some questions that arise — do you look fit for the job? What is the look that Checkr is searching for? All of these questions point toward a potential risk of Checkr perpetuating a bias based on aspects of a job candidate’s identity. Already, Checkr is facing lawsuits for the misidentification and misjudgments made by its AI, but that does not mean that algorithms like Checkr won’t become mainstream in the near future. Which leaves the question: how do we mitigate bias in algorithms so AIs like Checkr can ensure that all candidates get a fair chance?
How can bias be harmful?
<br/>
But first, let’s dive into a deeper understanding of how biases are harmful and why we should care. Bias is not in the algorithm itself. Rather, it is the information that we feed that algorithm that is the flaw. The machine is simply replicating social biases — prejudices in favor of or against one thing, person, or group compared with another. Algorithmic biases point to correlations that by themselves are not harmful. The issue occurs when their models and data are taken at face value without considering any patterns or preferences the algorithm may have adopted.
However, these correlations can be useful indicators for decision-making systems. Netflix is able to recommend movies based on you have previously watched. If you liked this Christmas Hallmark movie last year, then you must also like this year’s new Christmas Hallmark movie. Spotify is able to create different mixes based on the different genres of music you listen to. If you tend to listen to lo-fi music at 3 am, then Spotify will create a lo-fi mix for you to listen to at 3 am. However, this trend of “if you like X, then we can recommend you something like X” is not something we necessarily want. As consumers, we may want to try watching horror films instead. We may want to listen to rock at 3am instead. In the context of job applications, employers may be looking to diversify their group of employees.
One aspect of AI interview systems is that they compare your video to previously accepted hires and see that if your video is similar then you should be hired. If it sees that you speak differently or that your hair does not look “acceptable” then that can negatively impact your chances of being hired. According to the algorithm, individuals that get hired will look like current employees and this will just create a positive feedback loop for the algorithm. This does not allow for diversification nor opportunity for new and different individuals to be entered into the workforce.
The task of handling bias within hiring is quite daunting but so critical. As a stepping stone, we are intending to identify common biases in specific machine learning models as well as explore the domain of work in this field. Using two machine learning models, CLIP+ and DALL-E, the goal is to explore and understand the biases within these models. CLIP+ and DALL-E are both trained in language comprehension and image generation. If given a caption CLIP+ and DALL-E will generate an image based on that description.
<br/>
[Images generated by DALL-E and CLIP+]
Disclaimer: some content may be considered offensive to some viewers.
In order to demonstrate how prevalent bias is in machine learning, we are looking at these models’ generated images that exemplify identity biases (prejudices towards a certain race, income, sexual orientation, religion, gender, etc.). The examples below are images produced by CLIP+ and DALL-E when given the prompts, “terrorist”, “criminal”, and “doctor.”
<br/>
Images generated by CLIP+ of a terrorist.
<br/>
Images generated by CLIP+ of a criminal.
<br/>
Images generated by CLIP+ of a doctor.
<br/>
Immediately, one can identify certain characteristics of these images that perpetuate certain stereotypes. Now suppose, a security AI was tasked with identifying criminals from surveillance footage. Based on what CLIP+ has learned, those “criminals” will likely be males with brown skin and Afro-textured hair. Whereas, if given the same task with DALL-E, that same AI would be likely to flag males of lighter skin tones as criminals. As a result, a system designed to build a safer community instead is isolating a specific demographic and unfairly criminalizing them.
This is just one instance where unmitigated algorithmic biases can have serious ramifications on our lives. Rather than finding your new jam on Spotify, what if an AI decides that your hair makes you unfit for a job or that your gender makes you less likely to pay back a loan? If CLIP+ and DALL-E were used to generate the ideal job candidate, what image would they produce? Moreover, how do we account for the possible biases within their results? These are the questions we are aiming to answer. Specifically, we are currently attempting to develop bias mitigation measures to ensure that CLIP+ and DALL-E generate representative and non-skewed images to reduce the possibility of such unfair decisions."
);

INSERT INTO users (name)
VALUES ("Peter Husisian & Julia Allen, Intelligent Systems Subteam");

INSERT INTO posts (author_id, date, title, subtitle, paper, content) 
VALUES (
  4, 
  "2021-05-06", 
  "Optimal Classification Trees Paper Summary & Analysis", 
  "102 Claps", 
  "https://link.springer.com/article/10.1007/s10994-017-5633-9",
  "<h2>Paper Objective</h2>
Utilize the incredible speed-up (800 billion factor) in mixed-integer optimization enabled by hardware improvements (Although they were deemed too expensive to be practical in the past, the paper shows that these methods are practically solvable on real-world datasets and even outperform classification and regression trees (CART))
A decision tree is a flowchart-like structure where every node represents a “test” on an attribute, each branch represents the outcome of a test, and each leaf node represents a class label, or the decision taken after considering all attributes.<br/>
Because they are created using a top-down approach, the first splits are made with no regard to future splits, meaning they are rarely optimal. To address this, a pruning step is required after creating the tree. Optimizing decision trees is NP-hard, meaning that it has not been very explored before.<br/>
This paper uses mixed integer optimization to optimize the tree, a technique that is an integer program, with one or more variables constrained as integers.
<br/>
MIO programming was computationally expensive in the past, but solvers such as Gurobi and CPLEX have improved greatly over the last decade or two, meaning MIO is more useful than ever.
<h2>Paper Contributions</h2>
<br/>
The authors, motivated by rapid development of optimization theory and hardware improvements, present an algorithm that utilizes mixed-integer optimization (a linear program in which 1 or more of the variables are constrained to be integers).
The researchers revisited the classical optimal decision tree creation problem using the state-of-the-art MIO formulation approach.
<br/>
Previously, to find an optimal decision tree, the most common approach is through heuristics such as top down induction and pruning, and no effective algorithm that runs within time constraint is proposed.
By relaxing constraints, the resulting classification method — Optimal Classification Trees with hyperplanes — is easy to train.
<br/>
The paper assessed its results on a variety of synthetically-generated datasets by comparing the performance of optimal axis-aligned trees with normal decision trees, the performance of linear-split optimal decision trees with XGBoost and random forest. They used accuracy as their metric of comparison. Below is a plot showing the performance of the method averaged across 60 different tasks:
<br/>
https://medium.com/r/?url=https%3A%2F%2Flink.springer.com%2Farticle%2F10.1007%2Fs10994-017-5633-9
<h2>Potential Further Research and Applications</h2>
<br/>
This paper could add further discussion about the computational limitations of this method. The paper mentions that this method is feasible for datasets in the 1000s, but has very little specific analysis on where this number emerged from and what the hard boundaries are.<br/>
Further research could also look into improving the accuracy of these models — many applications would benefit from a model that can clearly delineate the reasoning behind its diagnosis, but they may require a greater degree of performance across the board than what the model currently provides. Additionally, future research could look into improving its performance in lower-dimensional problems, as these problems could also benefit from interpretable results.<br/>
One other potential direction could involve looking into alternative methods other than top-down induction to optimize splits so that the influence of future splits can be taken into consideration. Though this may be much more computationally expensive, the greedy approach of top-down induction can often lead to trees that don’t capture the underlying characteristics of the data.
<br/>
<h2>Conclusion</h2>
Decision trees are useful in that they provide transparency into the learned rule, which is desired for many real-world applications such as in finance and healthcare. Decision trees with axis-aligned splits excel at this because we can follow the path and give an easily interpretable boundary for each decision (ex. price/earning < 5 with revenue > 100,000 = buy the stock). With the improvements set forth by this paper, we can create optimal decision trees more efficiently with MIO to capture the patterns of the underlying dataset easier than other algorithms which may prioritize weaker splits and require significant pruning. The results of their experiments show that creating optimal decision trees is tractable and can be used in practice."
);

