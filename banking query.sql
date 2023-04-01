
SELECT *
  FROM [banking].[dbo].[banking_1];

 -- let us find the average age of customers
select Round(AVG(age),0) as average_age
from banking_1 ; --the average age of the customers is 41


-- what is the minimum and maximum age of the bank customers

select MIN(age)
from banking_1;

select MAX(age)
from banking_1;
-- the minimum age of the customer in the bank is 18 years while the maximum age of the customer in the bank is 95

-- let us analyse the customers by their occupations

SELECT job, COUNT(*) AS count
FROM banking_1
GROUP BY job
order by 2 desc;
-- the people who work in Management profession are the most customers in the bank while there are unkown are the least.

--which occupation has the highest balance accounts in the bank
select job, SUM(balance)
from banking_1
group by job
order by 2 desc;
-- management has the highest bank balance in the account

-- let us find the age group with the most customer
select age_group, count(age_group)
from
(select age,
        case when age between 18 and 25 then 'young'
              when age between 25 and 35 then 'middle'
              when age between 35 and 45 then 'grown'
              else 'elder'
              end as age_group
from banking_1) t
group by age_group;
--- customers between the age of 25 and 35 are the most in the bank



-- distribution of age by occupation
SELECT job,age, COUNT(age) as age_count, 
       ROUND(COUNT(age)*100.0/SUM(COUNT(age)) OVER(),2)*100 as percentage 
FROM  banking_1
GROUP BY job,age
order by job,3 desc;

--relationship between marital status and the bank balance
select marital, SUM(balance)
from  banking_1
group by marital
order by 2;
--the divorced have the least amount of money in the account while the married have the most


-- how does the level of education affect the bank balance
select education, avg(balance)
from banking_1
group by education
order by 2;

--does having a loan affect a customers bank balance
select loan, sum(balance)
from banking_1
group by loan;

-- whats the relationship between marital status and loan
SELECT marital, loan, COUNT(*) 
FROM banking_1
GROUP BY marital, loan;

