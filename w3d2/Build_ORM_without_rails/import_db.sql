PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO 
  users (fname, lname)
VALUES
  ('Whitman','Burke'),
  ('Ti','Guo');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('What is aa?', 'can someone help me with aa?',1),
  ('Question 2','question 2 body', 2);
  
INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 2),
  (2, 1);
  
INSERT INTO
  replies(body, parent_id, question_id, user_id)
VALUES
  ('this is the reply to the question 1', NULL, 1, 2),
  ('this is the reply to the question 2', NULL, 2, 1),
  ('this is the reply 2 to the question 1', 1, 1, 1),
  ('this is the reply 2 to the question 2', 2, 2, 2);
  
INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (2,1),
  (1,2);
  