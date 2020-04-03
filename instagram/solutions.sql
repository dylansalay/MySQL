-- Find the five oldest users 
SELECT * FROM users
ORDER BY created_at 
LIMIT 5;


-- Find the most popular registration date
SELECT 
    DAYNAME(created_at) AS Day,
    COUNT(*) AS Total
FROM users
GROUP BY Day
ORDER BY Total DESC 
LIMIT 2;

-- Find the users who have never posted a photo
SELECT username, image_url 
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE image_url IS NULL;

-- Identify most popular photo and the user who created it
SELECT  users.username AS Username, photos.id AS Photo_ID,
    COUNT(likes.user_id) AS Likes
FROM photos
JOIN likes 
    ON photos.id = likes.photo_id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY Likes DESC
LIMIT 1;

-- How many times does the average user post
Select(
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)
);

-- What are the top 5 most commonly used hashtags
SELECT COUNT(tags.id) as Total, tags.tag_name
FROM photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY Total DESC
LIMIT 5;

-- Find all users who have liked every single photo on the site
SELECT 
username,
COUNT(*) AS num_likes
FROM users 
JOIN likes
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


-- SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY',''));
