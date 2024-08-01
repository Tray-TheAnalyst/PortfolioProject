Select *
From ['Video_Game_Sales Cleaned$']

/*format date column to mm/dd/yyyy*//*apparently you gotta go big MM*/
Select [Initial release date], FORMAT([Initial release date], 'MM/dd/yyyy') as ReleaseDate_Cleaned
From  ['Video_Game_Sales Cleaned$']

/*Max Sales */
Select Series, Max(Sales) as Max_Sales
From ['Video_Game_Sales Cleaned$']
Group By Series
Order By Max_Sales DESC

/*Minimum Sales*/
Select Series, Min(Sales) as Min_Sales
From ['Video_Game_Sales Cleaned$']
Group By Series
Order By Min_Sales ASC

/*Top 5 Sales*/
Select Series, Max(Sales) as Max_Sales
From ['Video_Game_Sales Cleaned$']
Where Sales > 70430000
Group By Series


/*Bottom 5 Sales*/
Select Series, Min(Sales) as Min_Sales
From ['Video_Game_Sales Cleaned$']
Where Sales < 25000000
Group By Series
Order By Min_Sales ASC


/*Partition by Series count*/
Select Title, Series, FORMAT([Initial release date], 'MM/dd/yyyy') as ReleaseDate_Cleaned,
	COUNT(Series) Over(Partition By Series) as Series_Total
From ['Video_Game_Sales Cleaned$']


/*Use Common Table Expression (CTE) to FORMAT date; thus shortening the Select statement*/
WITH ReleaseDateCTE AS (
	Select Title, Series, FORMAT([Initial release date], 'MM/dd/yyyy') as Date_Cleaned, Sales,
		COUNT(Series) Over(Partition By Series) as Series_Total
	From ['Video_Game_Sales Cleaned$'])


	Select  *
	From ReleaseDateCTE

