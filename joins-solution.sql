--Get all customers and their addresses.
SELECT  * FROM "addresses"
JOIN "customers" ON "addresses"."id" = "customers"."id";

--Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

--Which warehouses have cheetos?
SELECT "warehouse"."warehouse", "warehouse_product"."on_hand" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."id" = 5

--Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse", "warehouse_product"."on_hand" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."id" = 6

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."id", count("orders"."address_id") FROM "addresses"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" on "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."id";

--How many customers do we have?
SELECT count(*) FROM "customers";

--How many products do we carry?
SELECT count(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
WHERE "warehouse_product"."product_id" = 6;

-- 9. How much was the total cost for each order?
SELECT "orders"."id", SUM("line_items"."quantity" * "products"."unit_price") AS "order_total" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id"
GROUP BY "orders"."id";

10. How much has each customer spent in total?
SELECT "customers"."id", SUM("line_items"."quantity" * "products"."unit_price") AS "order_total" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id"
JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
JOIN "customers" on "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."id";

11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
