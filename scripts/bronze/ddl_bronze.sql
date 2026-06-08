/*
===============================================================================
Script Name : Bronze Layer - Table Initialization (DataWarehouse)

Purpose :
    This script initializes the Bronze layer of the DataWarehouse by
    dropping and recreating all raw source tables.

    The Bronze layer represents the RAW ingestion layer in the Medallion
    Architecture. Data in this layer is stored exactly as received from
    source systems with minimal or no transformation.

    This script performs the following actions:
    1. Switches to the DataWarehouse database.
    2. Drops existing Bronze tables if they exist.
    3. Recreates all raw source tables for CRM and ERP systems.

Tables Included:
    - crm_cust_info        (Customer master data)
    - crm_prd_info         (Product master data)
    - crm_sales_details    (Sales transaction data)
    - erp_cust_az12        (ERP customer demographic data)
    - erp_loc_a101         (ERP location data)
    - erp_px_cat_g1v2      (ERP product category data)

Important Notes:
    - This is a FULL RESET script for the Bronze layer.
    - All data in these tables will be lost when re-run.
    - Designed for development, testing, or pipeline reinitialization.
===============================================================================
*/



-- USE `DataWarehouse` Database
USE DataWarehouse;
GO

-- “If this user table exists, drop it before recreating it.”
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

-- Create Tables
CREATE TABLE Bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);
GO


IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE Bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
)
GO


IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE Bronze.crm_sales_details (
	sls_ord_num INT,
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);
GO

IF OBJECT_ID('bronze.erp_cust_az12', 'U')  IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE Bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U')  IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U')  IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
GO

