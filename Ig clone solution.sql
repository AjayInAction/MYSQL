-- 1.  Finding the oldest five users 
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;


-- 2.  finding the best time to start a registering  campaign or what day most users register
SELECT 
    DAYNAME(created_at) AS day, COUNT(*) AS total
FROM
    users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. find the user who have never posted a photo (inactive user)
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.id IS NULL;

-- 4. identify most popular photo or most liked photo and the user who created it
SELECT 
    username, image_url, COUNT(*) AS number
FROM
    users
        JOIN
    photos ON users.id = photos.user_id
        JOIN
    likes ON photos.id = likes.photo_id
GROUP BY username , image_url
ORDER BY number DESC
LIMIT 1;

-- 5 . How many times does a average user post 
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS avg_post_by_every_user;

-- 6 most common used 5 hashtags
SELECT 
    tag_name, COUNT(*)
FROM
    photo_tags
        JOIN
    tags ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 7 users who have liked every photo 
SELECT 
    username, COUNT(*) AS num_likes
FROM
    users
        INNER JOIN
    likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT 
        COUNT(*)
    FROM
        photos)
