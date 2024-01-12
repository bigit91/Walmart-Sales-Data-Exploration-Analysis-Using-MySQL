use walmartSales ;
select * from sales ;

-- Generic Questions 
-- 1) How many unique cities does the data have?

select 
	distinct city 
from 
	sales ;


-- 2) In which city is each branch?

select
		distinct branch,city
from 
		sales ;



-- ------------------------------------------- Product Questions----------------------------------------------

-- 1) How many unique product lines does the data have?

select distinct
		product_line
from 
		sales ;


-- 2) What is the most common payment method?
select 	distinct payment,
		count(payment)
from 
		sales
group by 
		payment
order by 
		2 desc;


-- 3)What is the most selling product line?

select  product_line , count(product_line)
from sales 
group by product_line 
order by 2 desc;


-- 4)What is the total revenue by month?

select 
		month_name,
		sum(total) as total_revenue
from 
		sales
group by 
		month_name 
order by 
		2 desc;
        
        
        
-- 5)What month had the largest COGS?

select 
		month_name,
		sum(cogs) as Total_cogs
from 
		sales
group by 
		month_name 
order by 
		2 desc;
        

-- 6) What product line had the largest revenue?

select 
		product_line,
		sum(total) as total_revenue
from 
		sales
group by 
		product_line 
order by 
		2 desc;
        
 -- 7) What is the city with the largest revenue?       
 
 select 
		city,
		sum(total) as total_revenue
from 
		sales
group by 
		city 
order by 
		2 desc;
        

-- 8) What product line had the largest VAT?

select 
		product_line ,
        avg(vat) as avg_tax
from
		sales
group by 
		product_line
order by
		2 desc ;
        
-- 9 )Fetch each product line and add a column to those product line showing "Good", "Bad".
-- Good if its greater than average sales

WITH c1 AS (
    SELECT
        product_line,
        AVG(total) OVER (PARTITION BY product_line) AS avg_sales
    FROM
        sales
)

SELECT DISTINCT
    s.product_line,
    CASE 
        WHEN s.total > c1.avg_sales THEN 'Good'
        ELSE 'Bad'
    END AS sale_status
FROM
    sales s
JOIN
    c1 ON s.product_line = c1.product_line;


 
 
-- 10) Which branch sold more products than average product sold?

select 
		branch   ,
        sum(quantity) as qty
from 
		sales 
group by
		branch
HAVING 
		 sum(quantity) >  avg(quantity) ;
         
		
-- 11) what is the average rating of each product line ?

select  
		product_line,
		avg(rating)
from 
		sales 
group by 
		product_line 
order by 
		2 desc;
-- 12 ) What is the most common product_line by gender 

select 
		gender ,
        product_line,
        count(gender)
from 
		sales 
group by 
		gender ,product_line
order by 
		3 desc ;
        
        
        
-- ------------------------------------------- Sales Question ------------------------------------------------


-- 1) Number of sales made in each time of the day per weekday
select 
		time_of_day, 
		count(invoice_id) as total_sales 
from
		sales 
group by 
		time_of_day ;



-- 2) Which of the customer types brings the most revenue?

select 
		customer_type ,
		sum(total) as total_revenue
from 
		sales
group by 
		customer_type 
order by 
		2 desc ;

-- 3) Which city has the largest tax percent/ VAT (Value Added Tax)?

select 
		city ,
        avg(vat) as vat
from 
		sales
group by
		city
order by 
		2 desc ;
        
        
-- 4) Which customer type pays the most in VAT?
select 
		customer_type , 
		avg(vat) as tax
 from 
		sales
group by
		customer_type 
order by
		2 desc;
        
        
-- -------------------------------------- Customer quuestion ------------------------------------------------

-- 1) How many unique customer types does the data have?


select 
		  distinct customer_type  
from
		sales ;

        
        
        
-- 2 ) How many unique payment methods does the data have?

select 
		 distinct payment
from
		sales ;
  
  
  -- 3) What is the most common customer type?
 select 
		 customer_type  ,
        count(customer_type) total_customers
from
		sales 
group by
		customer_type
order by 
		2 desc;


-- 4 ) Which customer type buys the most :

select
		customer_type,
        count(invoice_id) as total_sales
from
		sales
group by
		customer_type
order by
		2 desc ;
        
-- 5) What is the gender of most of the customers?

select 
		gender ,
        count(*) as total_customers
from
		sales
group by 
		gender
order by 
		2 desc ;
        
-- 6) What is the gender distribution per branch?

select 
		branch ,
        gender ,
        count(*) as total_customers
        
from
		sales
group by
		branch ,
        gender
order by 
		1 ,3 desc;


-- 7) Which time of the day do customers give most ratings?

select
		time_of_day ,
		avg(rating) 
from
		sales
group by 
		time_of_day
order by
		2 desc 
limit 1 ;



-- 8)Which time of the day do customers give most ratings per branch?

with C1 as (select
		branch,
		time_of_day ,
		avg(rating) as avg_rating,
        ROW_NUMBER() OVER(PARTITION BY branch ORDER BY avg(rating) desc ) as rnk
from
		sales
group by 
		branch,
		time_of_day
)
select 
		branch,
		time_of_day ,
        avg_rating
from
		C1
where 
		rnk=1 ;
     
-- 9) Which day fo the week has the best avg ratings?

select 
		day_name ,
        avg(rating) as rating
from 
		sales 
group by 
		day_name 
order by
		2 desc
limit 1 ;

-- 10) Which day of the week has the best average ratings per branch?
	
WITH ranked_days AS (
    SELECT
        branch,
        day_name,
        AVG(rating) AS avg_rating,
        ROW_NUMBER() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS rnk
    FROM
        sales
    GROUP BY
        branch,
        day_name
)

SELECT
    branch,
    day_name,
    avg_rating
FROM
    ranked_days
WHERE
    rnk = 1;


select * from sales