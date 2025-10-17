-- Dimension table for customers, including their segments from clustering
CREATE TABLE dim_customer (
    customer_id BIGINT NOT NULL PRIMARY KEY,
    customer_segment INT NULL
);

-- Dimension table for dates
CREATE TABLE dim_date (
    order_date DATE NOT NULL,
    date_key DATE NOT NULL PRIMARY KEY,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL,
    quarter INT NOT NULL,
    day_of_week INT NOT NULL,
    week_of_year INT NOT NULL,
    day_type NVARCHAR(10) NOT NULL
);

-- Dimension table for orders
CREATE TABLE dim_order (
    order_id NVARCHAR(50) NOT NULL PRIMARY KEY,
    payment_status NVARCHAR(50) NULL,
    total_value FLOAT NULL
);


-- Fact table for order lines
CREATE TABLE fact_orderlines (
    order_line_id INT NOT NULL PRIMARY KEY,
    order_id NVARCHAR(50) NOT NULL,
    customer_id BIGINT NOT NULL,
    order_date DATE NOT NULL,
    sales_quantity INT NOT NULL,
    total_value FLOAT NULL,

    FOREIGN KEY (order_id) REFERENCES dim_order(order_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (order_date) REFERENCES dim_date(date_key)
);


-- Staging table for raw order lines data before transformation
CREATE TABLE staging_orderlines (
    order_id NVARCHAR(50) NULL,
    customer_id BIGINT NULL,
    order_date DATE NULL,
    total_value FLOAT NULL,
    payment_status NVARCHAR(50) NULL,
    product_id NVARCHAR(50) NULL,
    sales_quantity INT NULL,
    order_line_id INT NOT NULL PRIMARY KEY
);