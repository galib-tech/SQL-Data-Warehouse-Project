-- Creating a database
CREATE DATABASE DataWarehouse;

-- Creating schemas.
DROP SCHEMA IF EXISTS bronze CASCADE;
DROP SCHEMA IF EXISTS silver CASCADE;
DROP SCHEMA IF EXISTS gold CASCADE;

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
create SCHEMA gold;
