# Select all the data from table credit_card_data to check if the data was imported correctly.
select * from credit_card_data;

# Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE credit_card_data
DROP COLUMN Q4_balance;
select * from credit_card_data;

# Use sql query to find how many rows of data you have
select count(*) from credit_card_data;

# the unique values in some of the categorical columns
select distinct Offer_accepted from credit_card_data;
select distinct reward from credit_card_data;
select distinct mailer_type from credit_card_data;
select distinct credit_cards_held from credit_card_data;
select distinct household_size from credit_card_data;


# Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.
select  average_balance,customer_number from credit_card_data
order by average_balance desc
limit 10;

# What is the average balance of all the customers in your data
select avg(average_balance) from credit_card_data;

# What is the average balance of the customers grouped by Income Level? The returned result should have only two columns, income level and Average balance of the customers. Use an alias to change the name of the second column.
select average_balance ,income_level as living_standard from credit_card_data
group by income_level;

# What is the average balance of the customers grouped by number_of_bank_accounts_open? The returned result should have only two columns, number_of_bank_accounts_open and Average balance of the customers. Use an alias to change the name of the second column.
select average_balance, bank_accounts_open as number_of_accounts from credit_card_data
group by bank_accounts_open;

# What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column.
select credit_rating,avg(credit_cards_held) as avg_cc from credit_card_data
group by credit_rating;

# Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select credit_cards_held,avg(bank_accounts_open) from credit_card_data
group by credit_cards_held;   # there is no significant correlation between the two variables

# Credit rating medium or high filter by offer accepted
select * from credit_card_data
where credit_rating in('medium','high')
and offer_accepted='Yes';

# Credit cards held 2 or less filter by offer accepted
select * from credit_card_data
where credit_cards_held <= 2
and offer_accepted='Yes';

# Owns their own home filter by offer accepted
select * from credit_card_data
where own_your_home = 'Yes'
and offer_accepted='Yes';

# Household size 3 or more filter by offer accepted
select * FROM credit_card_data
where household_size >= 3
and offer_accepted='Yes';
  
  
# Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers. You might need to use a subquery for this problem.
select customer_number from credit_card_data
where average_balance <
(select avg(average_balance) from credit_card_data);

# Since this is something that the senior management is regularly interested in, create a view of the same query.
create view avg_balance_less_total_avg as
select customer_number from credit_card_data
where average_balance <
(select avg(average_balance) from credit_card_data);


# Your managers are more interested in customers with a credit rating of high or medium. What is the difference in average balances of the customers with high credit card rating and low credit card rating?
select avg(average_balance)
from credit_card_data
group by credit_rating
having credit_rating in('medium','high');

# What is the number of people who accepted the offer vs number of people who did not?
select count(*) as offer_accepted,(select count(*)  from credit_card_data
where offer_accepted = 'No') as not_accepted from credit_card_data
where offer_accepted = 'yes';

select count(*) from credit_card_data
where offer_accepted = 'No';

# In the database, which all types of communication (mailer_type) were used and with how many customers?
select mailer_type,count(*)
from  credit_card_data
group by mailer_type;

 # Provide the details of the customer that is the 11th least Q1_balance in your database.
select * from (select Q1_balance from credit_card_data
order by Q1_balance asc) as 11_customer
LIMIT 1 OFFSET 10;      # this fuction is not efficient has it returns customers even with zero balance

# so the ideal solution is to create a view of Q1 ranking and select the customers with 11th positions on the Q1 balance ranking ascending.
drop view ranking_Q1;

create view ranking_Q1 as
select *,(dense_rank() OVER(order by Q1_balance asc)) as Q1_rank from
credit_card_data;

select * from ranking_Q1
where Q1_rank= 11;


