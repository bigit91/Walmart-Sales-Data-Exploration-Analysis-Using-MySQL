# Walmart-Sales-Data-Exploration-Analysis-Using-MySQL

# Walmart Sales Data Exploration & Analysis Using MySQL

## About

The objective of this project is to analyze Walmart Sales data, with a focus on identifying top-performing branches and products, analyzing the sales trends of various products, and understanding customer behavior. The goal is to investigate opportunities for enhancing and optimizing sales strategies. The dataset used for this analysis was sourced from the [Kaggle Walmart Sales Forecasting Competition].(https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).


## Purpose Of The Project

The primary objective of this project is to get  insights from Walmart's sales data, aiming to comprehend the diverse factors influencing the sales performance of its various branches.



## About Data

The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |



## Steps Used

> 1. Build a database
> 2. Create table and insert the data.
> 3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set **NOT NULL** for each field, hence null values are filtered out.


** Adding New Columns:

	>  New column named `time_of_day` is added  to give insight of sales in the Morning, Afternoon and Evening. This will help to answer the question on 	which part of the day most sales are made.

	>  New column named `day_name` is added so that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, 	Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

	>  Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). 	Help determine which month of the year has the most sales and profit.


> 4. Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

> 5. Conclusion:




## Questions To Answer


1. How many unique cities does the data have?
2. In which city is each branch?

### Product

1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
5. What is the city with the largest revenue?
6. What product line had the largest VAT?
7. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
8. Which branch sold more products than average product sold?
9. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
4. Which customer type pays the most in VAT?

### Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?





For SQL queries please refer to the uploaded files or follow this link 
[SQL Files.zip](https://github.com/bigit91/Walmart-Sales-Data-Exploration-Analysis-Using-MySQL/files/13923928/SQL.Files.zip)
