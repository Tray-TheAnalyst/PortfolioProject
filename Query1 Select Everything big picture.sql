/* Below we are getting a general idea of the data (10k ft' view) */

--Select everything from Social Media USAGE; Order by Usage 
SELECT *
FROM SocialMediaUsage
ORDER BY 8 DESC

--Avg Social Media Usage based on our table

SELECT AVG([Social Media Usage (Hours/Day)]) AS AverageDaily_Use
FROM SocialMediaUsage

--Users age 30 and under
SELECT Age
FROM SocialMediaUsage
WHERE Age <= 30
ORDER BY Age

--Users over age 30
SELECT Age
FROM SocialMediaUsage
WHERE Age > 30
ORDER BY Age

--Number of users age 30 and under
Select sum(1)
From SocialMediaUsage
WHERE Age <= 30

--Number of users over age 30
Select sum(1)
From SocialMediaUsage
WHERE Age > 30

--Male users age 30 and under; order by Age or City
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age <= 30
ORDER BY Age

--Male users over age 30; order by Age or City
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age > 30
ORDER BY City

--Female users age 30 and under; order by Age or City
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Female' AND Age <= 30
ORDER BY Age

--Female users over age 30; order by Age or City
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Female' AND Age > 30
ORDER BY City


--Extract MAX amt out of a group 
SELECT Gender, MAX([Income (USD)]) AS Tot_Income
FROM SocialMediaUsage
--WHERE Age <= 30
Group BY Gender
ORDER BY Tot_Income

SELECT *
FROM SocialMediaInfluence