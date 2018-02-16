-----------------------------------------------------------------------------
TASKS
-----------------------------------------------------------------------------

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

-----------------------------------------------------------------------------
ADDITONAL QUESTIONS
-----------------------------------------------------------------------------

No coding necessary, explain the concept or sketch your thoughts.

We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

  I would implement a 'customer products list' table (CPL). Each CPL would have many 'list entries', this would be a joins table between the CPL and products. This would allow us to persist the lists in the db. Customer could save them and access them in the future. In addition to the space that would be needed to store the lists we would incur extra database reads and writes as well. The other approach would be to store the list client side. This would negate the above concerns, however this list would not persist across clients and as someone who likes to add things to my digital shopping carts as I think of them day to day, while on my computer or phone, I don't believe this approach would be ideal.

If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?

  I would implement a first come first serve policy. Given the exact inventory of stores, Shipt could keep track of all the inventory that has been 'claimed'. A customer would only 'claim' an item once they have checked out. If another user attempts to purchase an item which is no longer available, they would be notified when they try to checkout that the item is out of stock. If a user's cart contains an item which is no longer available, the next time they view their cart there would be a notice explaining the item is out of stock and the item would be moved to a 'saved for later' list.

-----------------------------------------------------------------------------
ADITION INFO
-----------------------------------------------------------------------------

Task 4:

  Raw SQL:
    SELECT COUNT(*) AS count_all, "orders"."customer_id" AS orders_customer_id, "first_name" AS first_name, "category_id" AS category_id, categories.name AS categories_name FROM "orders" INNER JOIN "order_items" ON "order_items"."order_id" = "orders"."id" INNER JOIN "products" ON "products"."id" = "order_items"."product_id" INNER JOIN "category_assignments" ON "category_assignments"."product_id" = "products"."id" INNER JOIN "categories" ON "categories"."id" = "category_assignments"."category_id" INNER JOIN "customers" ON "customers"."id" = "orders"."customer_id" GROUP BY "orders"."customer_id", "first_name", "category_id", categories.name


Things I would implement with more time:
- Access control for API, currently anyone can access the API
- Add indexes to tables
- More testing, i.e. bad input testing for controller, testing for other models and relationships
- Validation for models and fields
- I would like to add more options for task 7, i.e. current orders, orders and products etc

