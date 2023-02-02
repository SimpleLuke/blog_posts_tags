TRUNCATE TABLE posts, tags, posts_tags RESTART IDENTITY;

INSERT INTO posts (title) VALUES 
('How to use Git'),
('Ruby classes'),
('A foodie week in Spain'),
('Coding when traveling');

INSERT INTO tags (name) VALUES
('coding'),
('travel');

INSERT INTO posts_tags (post_id,tag_id) VALUES
(1,1),
(2,1),
(3,2),
(4,1),
(4,2);
