DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions_likes;

PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT, 
    users_id INTEGER NOT NULL,
    
    FOREIGN KEY (users_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    followers_of_question_id INTEGER NOT NULL,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (followers_of_question_id) REFERENCES user(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER, 
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)

);


CREATE TABLE questions_likes (
    id INTEGER PRIMARY KEY,
    user_likes_id INTEGER NOT NULL,
    question_liked_id INTEGER NOT NULL,

    FOREIGN KEY (user_likes_id) REFERENCES users(id),
    FOREIGN KEY (question_liked_id) REFERENCES questions(id)
);


INSERT INTO 
    users(fname, lname)
VALUES
    ('jeffrey', 'plante'),
    ('emily', 'bell');

INSERT INTO
    questions(title, body, users_id)
VALUES
    ('babies', 'where do babies come from?', (SELECT id FROM users WHERE fname = 'jeffrey' AND lname = 'plante')),
    ('hard work', 'are we working hard or hardly working?', (SELECT id FROM users WHERE fname = 'emily' AND lname = 'bell'));


INSERT INTO
    replies(subject_question_id, parent_reply_id, users_id, body)
VALUES
    (1, NULL, 1, 'ask your mom.'),
    (2, NULL, 2, 'do you actually want me to answer that question?'),
    (1, 1, 1, 'my mom is busy!!!!');



