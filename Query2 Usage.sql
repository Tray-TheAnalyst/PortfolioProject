/*Below we are looking for any patterns related Usage per group of users/city/platform/hrs */

--Male users age 30 and under; order by Social Media Usage hrs per day
SELECT [Consumer ID], [Customer Name], Age, City, [Social Media Usage (Hours/Day)]
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age <= 30
ORDER BY [Social Media Usage (Hours/Day)]

--Male users over age 30; order by Social Media Usage hrs per day
SELECT [Consumer ID], [Customer Name], Age, City, [Social Media Usage (Hours/Day)]
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age > 30
ORDER BY [Social Media Usage (Hours/Day)]

--Female users age 30 and under; order by Social Media Usage hrs per day
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Female' AND Age <= 30
ORDER BY [Social Media Usage (Hours/Day)]

--Female users over age 30; order by Social Media Usage hrs per day
SELECT [Consumer ID], [Customer Name], Age, City
FROM SocialMediaUsage
WHERE Gender = 'Female' AND Age > 30
ORDER BY [Social Media Usage (Hours/Day)]

--Below, show what (1)platforms each group uses, (2)platforms most used; order by SM Usage hrs per day

	--(1)platforms each group uses
SELECT [Consumer ID], [Customer Name], Age, City, [Social Media Usage (Hours/Day)], [Social Media Platforms]
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age <= 30 
ORDER BY [Social Media Usage (Hours/Day)]

	--(1B)each group uses which (ie below is Instagram) platform
SELECT [Consumer ID], [Customer Name], Age, City, [Social Media Usage (Hours/Day)], [Social Media Platforms]
FROM SocialMediaUsage
WHERE Gender = 'Male' AND Age <= 30 AND [Social Media Platforms] LIKE '%Instagram%'
ORDER BY [Social Media Usage (Hours/Day)]


--(2)individual platforms most used... LIKE '%Instagram%' etc  NOTE: To Show indiv. City info WILL HAVE TO PARTION'ING by City 
SELECT Age, City, [Social Media Usage (Hours/Day)], [Social Media Platforms],
	COUNT(City) OVER(PARTITION BY City) AS Tot_Cities
FROM SocialMediaUsage
WHERE [Social Media Platforms] LIKE '%Instagram%' 
ORDER BY [Social Media Usage (Hours/Day)] DESC


	--Platforms most used, per hours (instead of) # of people using said platforms [Social Media Platforms]... LIKE '%Instagram%' etc
	--ORDER BY [Social Media Usage (Hours/Day)]

SELECT [Social Media Usage (Hours/Day)], [Social Media Platforms], COUNT(*)
FROM SocialMediaUsage
WHERE [Social Media Platforms] LIKE '%Instagram%' 
GROUP BY [Social Media Usage (Hours/Day)], [Social Media Platforms]
HAVING COUNT(*) > 1
ORDER BY [Social Media Usage (Hours/Day)] DESC


--Are there cities that are greatly influenced to buy, based on Usage (hrs/day)? 
SELECT usg.City, usg.[Social Media Usage (Hours/Day)], inf.[Influence Level],
	COUNT(usg.City) OVER(PARTITION BY usg.City) AS TotCities_Use
FROM SocialMediaUsage AS usg
JOIN SocialMediaInfluence AS inf
	ON usg.[Consumer ID] = inf.[Consumer ID]
--GROUP BY usg.City 


--Are there cities that are greatly influenced to buy, based on Social Media Platform? 
SELECT usg.City, inf.[Social Media Platforms], inf.[Influence Level],
	COUNT(usg.City) OVER(PARTITION BY usg.City) AS TotCities_Use
FROM SocialMediaUsage AS usg
JOIN SocialMediaInfluence AS inf
	ON usg.[Consumer ID] = inf.[Consumer ID]
WHERE usg.[Social Media Platforms] LIKE '%Instagram%' AND inf.[Influence Level] = 'Very Influential'
--WHERE usg.[Social Media Platforms] LIKE '%Facebook' AND inf.[Influence Level] = 'Very Influential'
--WHERE usg.[Social Media Platforms] LIKE '%Tik Tok%' AND inf.[Influence Level] = 'Very Influential'


--Rolling Total of SM Usage (in Hours) per city, while showing Influence Level & Platforms used
SELECT usg.City, inf.[Social Media Platforms], inf.[Influence Level], usg.[Social Media Usage (Hours/Day)],
	SUM(usg.[Social Media Usage (Hours/Day)]) OVER(PARTITION BY usg.City ORDER BY usg.[Social Media Usage (Hours/Day)]) AS HrsPerCity_RollingTotal
FROM SocialMediaUsage AS usg
JOIN SocialMediaInfluence AS inf
	ON usg.[Consumer ID] = inf.[Consumer ID]
--WHERE usg.[Social Media Platforms] LIKE '%Instagram%' AND inf.[Influence Level] = 'Very Influential'
--WHERE usg.[Social Media Platforms] LIKE '%Facebook' AND inf.[Influence Level] = 'Very Influential'
--WHERE usg.[Social Media Platforms] LIKE '%Tik Tok%' AND inf.[Influence Level] = 'Very Influential'



 


Select *
From SocialMediaUsage

Select *
From SocialMediaInfluence