-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;
use walmartSales ;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    vat FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);


-- -----------------------------------------------------------------------------------------------------------
--                                             Feature Engineering                                          --
-- -------------------------------------------- Adding Columns -----------------------------------------------
-- time_of_day

select
		time ,
       ( case
			when time between "00:00:00" and "12:00:00" then "Morning" 
			when time between "12:01:00" and "16:00:00" then "Afternoon" 
            else "Evening"
            end
		) as time_of_day
from
		sales ;



-- day_name

select 
		date,
        dayname(date) 
from 
		sales;


-- Month name 

select 
		date,
		monthname(date)
from 
		sales;



-- -----------------------------------------------------------------------------------------------------------
-- Adding  column named "time_of_day" to the sales table 

Alter table sales add column time_of_day VARCHAR(20);

update sales 
set time_of_day = ( case
			when time between "00:00:00" and "12:00:00" then "Morning" 
			when time between "12:01:00" and "16:00:00" then "Afternoon" 
            else "Evening"
            end
				) ;



-- Adding column named "day_name" to the sales table

Alter table sales add column day_name VARCHAR(10);


update sales

set day_name = dayname(date);




-- Adding column named "month_name" to the sales table

Alter table sales add column month_name VARCHAR(20);

update sales

set month_name = monthname(date) ;
