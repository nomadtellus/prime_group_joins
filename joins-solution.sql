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
--How many products do we carry?
--What is the total available on-hand quantity of diet pepsi?
