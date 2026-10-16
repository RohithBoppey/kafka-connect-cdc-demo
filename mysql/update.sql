-- -- CRUD operations
-- INSERT INTO customers (name, email) VALUES
--   ('Rohith', 'rohith.boppey@example.com'),
--   ('Jaswanth',   'jaswanth.boppey@example.com');

-- -- schema change
-- ALTER TABLE customers ADD COLUMN TEMP_COLUMN int;

delete from customers where name = 'Rohith';

select * from customers; 