# Customer Segmentation & Data Warehouse Project

## 📋 Project Overview

An end-to-end **Big Data Analytics** project that implements customer segmentation using **K-Means clustering** on RFM (Recency, Frequency, Monetary) analysis. The project includes data transformation pipelines, a star schema data warehouse, and machine learning-based customer segmentation.

### Key Features
- ETL pipeline using **PySpark** for processing large-scale order data
- **Star Schema** data warehouse design with dimension and fact tables
- **RFM Analysis** for customer behavior insights
- **K-Means Clustering** for customer segmentation (4 segments)
- Interactive data visualizations (2D & 3D scatter plots)
- Distributed processing on **Hadoop/HDFS** with **Hive** integration

---

## 🏗️ Architecture

### Data Flow
```
Raw JSON Data → PySpark ETL → Staging Table → Dimension/Fact Tables → RFM Analysis → K-Means Clustering → Customer Segments
```

### Star Schema Design
- **Fact Table**: `fact_orderlines` (Order line-level transactions)
- **Dimension Tables**:
  - `dim_customer` (Customer segments from clustering)
  - `dim_date` (Date attributes for time-series analysis)
  - `dim_order` (Order-level details)
- **Staging Table**: `staging_orderlines` (Flattened raw data)

---

## 🛠️ Technology Stack

| Category | Technologies |
|----------|-------------|
| **Big Data Processing** | Apache Spark (PySpark), Hadoop HDFS, Apache Hive |
| **Machine Learning** | Spark MLlib |
| **Data Visualization** | Matplotlib, Pandas |
| **Database** | Hive Tables (Parquet format) |
| **Storage Format** | Parquet with Snappy compression |

---

## 📊 Customer Segmentation Results

The K-Means model identified **4 distinct customer segments**:

| Segment | Description | Characteristics |
|---------|-------------|-----------------|
| **Regulars** | Moderate activity customers | Medium recency, frequency, and monetary value |
| **Loyal** | Frequent repeat customers | Low recency, high frequency |
| **Big Spenders / VIP** | High-value customers | High monetary value, consistent purchases |
| **Churned / Inactive** | At-risk customers | High recency (long time since last purchase) |

### Clustering Performance
- **Optimal K**: 4 (determined via Elbow Method)
- **Features**: Recency, Frequency, Monetary (standardized)
- **Algorithm**: K-Means

---

## 📁 Project Structure

```
Customer Segmentation & Data Warehouse Project/
│
├── data/
│   ├── raw_orders.json              # Raw order data
│   └── database_schema.sql          # SQL DDL for data warehouse
│
├── notebooks/
│   ├── Transformations.ipynb        # ETL pipeline & data warehouse creation
│   └── KMeans_Model.ipynb           # RFM analysis & customer segmentation
│
├── docs/
│   ├── Star Schema.png              # Data warehouse schema diagram
│   └── Database view.png            # Database visualization in Hive
│
└── README.md                         # Project documentation
```

---

## 💻 Usage

### 1. Data Transformation & Warehouse Creation
Run the `Transformations.ipynb` notebook to:
- Load and flatten raw JSON data
- Create staging table
- Build star schema (dimension & fact tables)
- Generate RFM metrics

```python
# Key transformation steps:
# - Explode nested JSON items
# - Cast data types (date, numeric)
# - Generate unique order_line_id
# - Create dimension tables (date, order, customer)
# - Build fact table (orderlines)
```

### 2. Customer Segmentation
Run the `KMeans_Model.ipynb` notebook to:
- Perform RFM analysis
- Apply K-Means clustering
- Visualize customer segments
- Update `dim_customer` table with segments

```python
# Clustering pipeline:
# - Feature assembly (RFM)
# - StandardScaler for normalization
# - Elbow method for optimal K
# - K-Means training (k=4)
# - 2D/3D visualization
```

---

## 📈 Sample Visualizations

### Elbow Method
Determined optimal number of clusters (k=4) by analyzing WSSSE (Within-Set Sum of Squared Errors)

### Customer Segmentation Plots
- **Frequency vs Monetary**: Identifies high-value customers
- **Recency vs Frequency**: Detects churned vs active customers
- **3D RFM Plot**: Comprehensive view of all three dimensions

---
