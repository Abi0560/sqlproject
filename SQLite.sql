
--A SIMPLE EXPLORATORY DATA ANALYSIS 


--Here we look at journal papers from 2016 to 2024 Aug focussing on suppy chains and try to find simple insights from it 
--1112 papers have been found to be written on topic supply chain as keyword and disruption as refine keyword 
--this analysis focuses on india and is limited to only journal papers
--here topic covid is excluded on the dataset to get more insight into how other areas have been affected 
--not considering effects of the pandemic


--checking for empty rows and to see if table is clean and has no quality issues as it matches to 1112 results from original file

SELECT COUNT (doi) AS numberofdata
FROM supplychain;

--checking which author of team of authors have published more in the recent years

SELECT authors , COUNT(*) AS num_of_journals
FROM supplychain
GROUP BY authors
ORDER BY num_of_journals DESC;

--displaying the increasing focus on research activity focusing on disruptions (supply chain) 

SELECT year, COUNT(*) AS number_of_journals
FROM supplychain WHERE author_keywords LIKE '%disruption%'
GROUP BY year
order by year DESC;

--here we can see the increased focus on the topic supplychain after 2020 

SELECT year,COUNT(*) AS number_of_journals
FROM supplychain
GROUP BY year
ORDER BY number_of_journals DESC;

--idk what this is 

SELECT publisher, COUNT(year) AS year1 
FROM supplychain
GROUP BY publisher
ORDER BY year1 DESC;

--NUMBER of journals from india showing inaccuracy of search filter when data is extracted

SELECT COUNT(*) AS number_of_journals
FROM supplychain
WHERE correspondence_address LIKE '%india%';

--displaying all the faulty information 

SELECT correspondence_address 
FROM supplychain
WHERE correspondence_address NOT LIKE '%india%';

--inaccuracy in filtering out topics related to covid

SELECT COUNT(*) AS number_of_journals
FROM supplychain
WHERE author_keywords LIKE '%covid%';

--
