-- world database
-- 1. Find country name with most population from table country
SELECT Name, Population FROM `country` ORDER BY Population DESC;

-- 2. Find the second one country with most population from table country
SELECT Name FROM `country` ORDER BY Population DESC LIMIT 1 OFFSET 1;

-- 3. Find country name with lowest population from table country
SELECT Name FROM `country` ORDER BY Population ASC LIMIT 1;

-- 4. Find the third one country with lowest population from table country
SELECT Name FROM `country` ORDER BY Population ASC LIMIT 1 OFFSET 2;

-- 5. Find the largest country by sum surface area with life expectancy more than 75
SELECT name FROM country WHERE LifeExpectancy > 75 ORDER BY SurfaceArea DESC LIMIT 1;