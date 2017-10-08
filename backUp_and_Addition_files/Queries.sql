SELECT DISH.NUM_DISH, DISH.DISH_NAME, MENU.MENU_NAME, string_agg(INGREDIENT.INGREDIENT_NAME, ', ') AS INGREDIENTS, DISH.WEIGHT, DISH.COST FROM DISH 
	INNER JOIN DISH_INGREDIENT on DISH.NUM_DISH = DISH_INGREDIENT.DISH_ID 
	INNER JOIN INGREDIENT on DISH_INGREDIENT.INGREDIENT_ID = INGREDIENT.NUM_INGREDIENT 
	INNER JOIN MENU_DISHES on DISH.NUM_DISH = MENU_DISHES.DISH_ID
	INNER JOIN MENU on MENU_DISHES.MENU_ID = MENU.NUM_MENU
		GROUP BY DISH.NUM_DISH, DISH.DISH_NAME, MENU.MENU_NAME, DISH.WEIGHT, DISH.COST ORDER BY DISH.NUM_DISH;
		
SELECT GUEST_ORDER.ID, EMPLOYEE.NAME, string_agg(DISH.NAME, ', ') AS DISH_ORDER, GUEST_ORDER.TABLE_NUMBER, GUEST_ORDER.DATE_ORDER FROM GUEST_ORDER
	INNER JOIN DISH_ORDER ON GUEST_ORDER.ID = DISH_ORDER.ORDER_ID
	INNER JOIN DISH ON DISH_ORDER.DISH_ID = DISH.ID
	INNER JOIN EMPLOYEE ON GUEST_ORDER.EMPLOYEE_ID = EMPLOYEE.ID
		GROUP BY GUEST_ORDER.ID, EMPLOYEE.NAME, GUEST_ORDER.TABLE_NUMBER, GUEST_ORDER.DATE_ORDER;
		
SELECT WAREHOUSE.INGREDIENT_ID AS ID, INGREDIENT.NAME, WAREHOUSE.AMOUNT, WAREHOUSE.UNIT FROM WAREHOUSE
	INNER JOIN INGREDIENT ON WAREHOUSE.INGREDIENT_ID = INGREDIENT.ID;

-- QUERIES EXAMPLE --
-- delete row example --
DELETE FROM table_name WHERE ID = ?;
-- Add column --
ALTER TABLE table_name ADD COLUMN column_name column_type;
-- Rename column --
ALTER TABLE table_name RENAME COLUMN column_name TO column_name;
-- Set value of certain column --
UPDATE table_name SET column_name = column_argument;
-- Set unique of certain column --
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (thecolumn);
-- Alter column size --
ALTER TABLE table_name ALTER COLUMN column_name TYPE character varying(60);
-- Alter column --
ALTER TABLE table_name add COLUMN column_name BOOLEAN NOT NULL DEFAULT TRUE;
-- Drop constraint --
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
-- Change column position --
alter table table_name rename to oldtable;
create table tablename (column defs go here);
insert into table_name (column1, column2, column3) select column1, column2, column3 from oldtable;
-- Insert values --
INSERT INTO table_name (column1, column2, column3)VALUES('string_value', 'date_value', number_value);
-- Delete by criteria --
delete from dtable_name WHERE column_name is null;
