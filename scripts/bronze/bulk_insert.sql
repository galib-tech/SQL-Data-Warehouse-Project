/*
=====================================================================
= Stored Procedure: Load Bronze Layer (Source -> Bronze)
=====================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
=====================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$


DECLARE 
		start_time TIMESTAMP;
		end_time TIMESTAMP;
		
DECLARE 
		batch_start_time TIMESTAMP;
		batch_end_time TIMESTAMP;

BEGIN

	batch_start_time := clock_timestamp();
	-- Data insert in tables

	RAISE NOTICE '==============================';
	RAISE NOTICE 'Loading Bronze Layer';
	RAISE NOTICE '==============================';


	RAISE NOTICE '------------------------------';
	RAISE NOTICE 'Loading CRM Layers';
	RAISE NOTICE '------------------------------';

	
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_cust_info;
	COPY bronze.crm_cust_info
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
	WITH (FORMAT csv, HEADER TRUE);
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading Duration: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';



	RAISE NOTICE '------------------------------';
	
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_prd_info;
	COPY bronze.crm_prd_info
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
	WITH (FORMAT csv, HEADER TRUE );
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading duration: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';
	



	RAISE NOTICE '------------------------------';
	
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_sales_details;
	COPY bronze.crm_sales_details
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
	WITH (FORMAT csv, HEADER TRUE);
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading duration: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';




	RAISE NOTICE '------------------------------';
	RAISE NOTICE 'Loading ERP Layer';
	RAISE NOTICE '------------------------------';

	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_cust_az12;
	COPY bronze.erp_cust_az12
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
	WITH (FORMAT csv, HEADER TRUE);
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading duration: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';




	RAISE NOTICE '------------------------------';
	
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_loc_a101;
	COPY bronze.erp_loc_a101
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
	WITH (FORMAT csv, HEADER TRUE);
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading duration: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';




	RAISE NOTICE '------------------------------';

	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	COPY bronze.erp_px_cat_g1v2
	FROM 'E:/sql/sql_bara/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
	WITH (FORMAT csv, HEADER TRUE);
	end_time := clock_timestamp();
	RAISE NOTICE '>> Loading duration: % sec',EXTRACT(EPOCH FROM (end_time - start_time));

	RAISE NOTICE '------------------------------';

	batch_end_time := clock_timestamp();
	RAISE NOTICE '>> Total duration in batch processing: % sec', EXTRACT(EPOCH FROM (end_time - start_time));

EXCEPTION WHEN OTHERS THEN
	RAISE NOTICE 'Error message: %', SQLERRM;
	RAISE NOTICE 'Error code: %', SQLSTATE;
		

END;
$$;
