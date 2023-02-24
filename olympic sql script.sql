OLYMPIC GAMES DATA:-

#--------BUSINESS REQUEST-------#
*Visualize data that will help readers understand how countries have performed historically in summer olympic games.
*Details of the competitors only if something intresting.
*MAIN TASK:= Show historical performance for different coluntries with possiblity to select different countries. 






----TRANSFORMATIONS:-
1. Change name into Competitors name
2. Used case statement on "sex" column to further categorize the data into male and female
3. Used case statement to perform grouping on the age column for better analysis as per the business request.
4. Extracted year and season column out of games column using right and left built-in function.
5. Used case function in medal column to change the 'NA' data into 'Not registered'.
6. Used right function to extract only that data where in the season is in 'summer' to align it with the business request.



**SQL SCRIPT USED IN THE SQL SERVER MANAGEMENT STUDIO FOR EXTRACTION OF RELEVENT DATA**
/****** Script command from SSMS  ******/


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
  
  
  ###--------- THE DATASET IS OF 75MB DUE TO WHICH I WAS UNABLE TO LOAD IT INTO GITHUB. THE LINK OF THE DATASET IS "https://www.dropbox.com/s/3sxwx52o3x8ozj7/olympic_games.bak?dl=0"---------###
