select * from Shark_tank..data

--total episodes
select count(distinct(epno)) from Shark_tank..data
--or
select max(epno) from Shark_tank..data

-- total no of pitches or brand comes 
select count(distinct(brand)) from Shark_tank..data

-- total no of brand gets amount
select count(amountinvestedlakhs) as get from shark_tank..data where amountinvestedlakhs>0 

-- toatl money invested in lakhs
select sum(amountinvestedlakhs) from shark_tank..data where amountinvestedlakhs>0

--marking column 'amountinvestedlakhs' as 0 and 1 or pitches converted
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as get_or_Notget from Shark_tank..data 

--total male
select sum(male) from Shark_tank..data

--total female
select sum(female) from Shark_tank..data

--gender ration
select sum(female)/sum(male) from Shark_tank..data

--average equityy taken
select avg(equitytakenp) from Shark_tank..data where equitytakenp > 0
--OR
select avg(a.equitytakenp) as avg_equity_taken from (select * from Shark_tank..data where equitytakenp>0) a

--brand which taken highet amount
select (max(amountinvestedlakhs) ) from Shark_tank..data 

-- highest equity taken by shark
select max(equitytakenp) from Shark_tank..data

--startup having at least one female
select count(female) from Shark_tank..data where Female>0 

--no of distinct location
select count(distinct(location)) from Shark_tank..data

--no of money (lakhs) invested by each and highest and lowest investment
--by Ashneer
select sum(AshneerAmountInvested) as total_amount,max(AshneerAmountInvested) as max_invest,min(AshneerAmountInvested) as min_invest from Shark_tank..data
--by Namita
select sum(NamitaAmountInvested) as total_amount,max(NamitaAmountInvested) as max_invest,min(NamitaAmountInvested) as min_invest from Shark_tank..data
--by Anupam
select sum(AnupamAmountInvested) as total_amount,max(AnupamAmountInvested) as max_invest,min(AnupamAmountInvested) as min_invest from Shark_tank..data
--Vineeta
select sum(VineetaAmountInvested) as total_amount,max(VineetaAmountInvested) as max_invest,min(VineetaAmountInvested) as min_invest from Shark_tank..data
--Aman
select sum(AmanAmountInvested) as total_amount,max(AmanAmountInvested) as max_invest,min(AmanAmountInvested) as min_invest from Shark_tank..data
--peyush
select sum(a.PeyushAmountInvested) as total_amount,max(a.PeyushAmountInvested) as max_invest,min(a.PeyushAmountInvested) as min_invest from (
select * from Shark_tank..data where PeyushAmountInvested!='NA') a
--Ghazal
select sum(PeyushAmountInvested) as total_amount,max(PeyushAmountInvested) as max_invest,min(PeyushAmountInvested) as min_invest from Shark_tank..data


--got deal have at least one mail
select count(b.Female_c) from
(select  case when a.female > 0 then 1 else 0 end as Female_c,a.* from (
select * from Shark_tank..data where Deal!='No Deal') a) b

--average of team member
select avg(Teammembers) from Shark_tank..data

-- what is average amount per deal(successful pitches)
select avg(a.Amountinvestedlakhs) as avg_amount_per_deal from 
(select * from Shark_tank..data where deal!='NO deal') a

--the avg age group of contestant
select avg_age,count(avg_age) as cnt from Shark_tank..data group by avg_age order by cnt desc

-------unique location 
select count(distinct(location)) from shark_tank..data where location!='NULL'


-- the location from which most of contestant comes from
select location,count(location) as cnt from Shark_tank..data where location!='NULL' group by location order by cnt desc

--sector wise analysis
select sector,count(sector) as cnt from Shark_tank..data where sector!='NULL' group by sector order by cnt desc



--partner deals
select partners,count(partners) as cnt from Shark_tank..data where partners!='-' group by partners order by cnt desc

--total no of pitches in which ashneer is present 
select count(ashneeramountinvested) from Shark_tank..data where ashneeramountinvested is not NULL

--total no of pitches in which ashneer had invested
select count(ashneeramountinvested) from Shark_tank..data where ashneeramountinvested is not NULL and ashneeramountinvested!=0

-----
select 'ashneer' as keyy ,sum(a.AshneerAmountInvested) as total_amount,max(a.AshneerAmountInvested) as max_invest,min(a.AshneerAmountInvested) as min_invest,avg(a.AshneerAmountInvested) as avg_investement,avg(a.Ashneer_Equity_Taken_p) as avg_equity from(
select * from Shark_tank..data where Ashneer_Equity_Taken_p!=0 and Ashneer_Equity_Taken_p is not null) a
