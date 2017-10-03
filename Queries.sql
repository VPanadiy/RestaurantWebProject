﻿SELECT DISH.NUM_DISH, DISH.DISH_NAME, MENU.MENU_NAME, string_agg(INGREDIENT.INGREDIENT_NAME, ', ') AS INGREDIENTS, DISH.WEIGHT, DISH.COST FROM DISH 
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
DELETE FROM TABLE_NAME WHERE ID = ?;
-- Add column --
ALTER TABLE TABLE_NAME ADD COLUMN COLUMN_NAME column_type;
-- Rename column --
ALTER TABLE TABLE_NAME RENAME COLUMN COLUMN_NAME TO COLUMN_NAME;
-- Set value of certain column --
UPDATE TABLE_NAME SET COLUMN_NAME = column_argument;
-- Set unique of certain column --
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (thecolumn);

INSERT INTO table_name (code, title, did, date_prod, kind)
VALUES ('T_601', 'Yojimbo', 106, '1961-06-16', 'Drama');
delete from dish_to_ingredient WHERE dish_id is null;