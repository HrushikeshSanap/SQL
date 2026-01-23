Show databases;

Use world;
select * from city;
select * from country;
## Question 1 : Count how many cities are there in each country?

SELECT co.Name as CountryName, COUNT(ci.ID) as NumberOfCities FROM country as co
LEFT JOIN city as ci ON co.Code = ci.CountryCode
GROUP BY co.Name
ORDER BY NumberOfCities DESC;

##Question 2 : Display all continents having more than 30 countries.

Select Continent, Count(Name) as NumberofCountries From Country
Group by Continent having Count(Name)>30;

##Question 3 : List regions whose total population exceeds 200 million.

Select Region, sum(Population) as Total_Population
From Country group by Region having sum(Population) >200000000;

##Question 4 : Find the top 5 continents by average GNP per country.

Select Continent, Avg(Gnp) as AVG_GNP from Country group by Continent order by AVG_GNP DESC Limit 5;

##Question 5 : Find the total number of official languages spoken in each continent.

Select co.Continent, Count(Distinct cl.Language) as Total_Official_Language 
from Country as co join countrylanguage as cl 
on co.Code = cl.CountryCode where cl.Isofficial='T' group by co.continent;

##Question 6 : Find the maximum and minimum GNP for each continent.

Select Continent, Max(GNP) as MAX_GNP, Min(GNP) as MIN_GNP From Country where GNP is not Null group by continent;

##Question 7 : Find the country with the highest average city population.

Select c.Name as Country_Name, avg(ci.Population) as Highest_AVG_CityPopulation from Country as c join City as ci on c.Code=ci.CountryCode
group by c.Code,c.Name
Order by Highest_AVG_CityPopulation desc  limit 1;

##Question 8 : List continents where the average city population is greater than 200,000

Select c.Continent, avg(ci.Population) as AVG_CITYPOPULATION from Country as c join City as ci  on c.Code=ci.CountryCode
group by c.Continent
having avg(ci.Population) > 200000;

##Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending

Select Continent, Sum(Population) as Total_Population , avg(LifeExpectancy) as AVG_LIFE_EXPECTANCY FROM country 
where LifeExpectancy is not null
group by Continent
order by avg(LifeExpectancy) desc;

##	Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

select Continent, avg(LifeExpectancy) as HALE, sum(Population) as TP from country
where LifeExpectancy is not null
Group by Continent
having sum(population) > 200000000
Order by HALE desc limit 3;