Tasks

Please implement the following stories.

1. A product belongs to many categories. A category has many products. A product can be sold in decimal amounts (such as weights).

2. A customer can have many orders. An order is comprised of many products. An order has a status stating if the order is waiting for delivery, on its way, or delivered.

3. Write a SQL query to return the results as display below:

  Example

    customer_id customer_first_name category_id category_name number_purchased

1 John 1 Bouquets 15

4. Include the previous result as part of a function in the application. If you are using an ORM, please write the query in your ORM's DSL. Leave the original SQL in a separate file.

5. An API endpoint that accepts a date range and a day, week, or month and returns a breakdown of products sold by quantity per day/week/month.

6. Ability to export the results of #5 to CSV.

7. An API endpoint that returns the orders for a customer.

Additional questions

No coding necessary, explain the concept or sketch your thoughts.

We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?






Things I would implement with more time:

- Access control for API
- More testing
- Validation for models and fields
