CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
)

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

INSERT INTO users (username) VALUES
('Bob'),
('Jane'),
('Tiger');

INSERT INTO photos (image_url, user_id) VALUES
('/jfjwfb64', 1),
('/jdnsva23', 2),
('/fbdqpa49', 2);

INSERT INTO comments (comment_text, user_id, photo_id) VALUES 
('Hi There', 1, 2 ),
('Goodbye', 3, 2 ),
('Beunos Dias', 2, 1 );

SELECT username, photos.image_url, photos.created_at
FROM photos
JOIN users
ON photos.user_id = users.id;