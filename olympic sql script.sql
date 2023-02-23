/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ID]
      ,[Name] as "Competitors_Name"
      ,case when sex= 'M' then 'Male' else 'Female' end as Sex
      ,case when age<18 then 'Below 18'
	  when age between 18 and 25 then '18-25'
	  when age between 25 and 30 then '25-30'
	  when age >30 then 'Above 30'
	  end as 'Age grouping'
      ,[Height]
      ,[Weight]
      ,[NOC] as "National_Code"
      ,left(games,charindex(' ',games)-1) as year
	  ,right(games,charindex(' ',reverse(games))-1) as season 
      --,[City]
      ,[Sport]
      ,[Event]
      ,case when medal ='NA' then 'Not_registered' else medal end as medal
  FROM [olympic_games].[dbo].[athletes_event_results]
  where right(games,charindex(' ',reverse(games))-1)='Summer'