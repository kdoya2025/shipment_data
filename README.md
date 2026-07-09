# Global Shipment & Customs Logistics Data Analysis & Predictive Modeling (2024 - 2025)

## 📌 Project Overview
This repository contains an end-to-end data analysis and machine learning workflow tracking global supply chain efficiency, shipping costs, and customs throughput times. The project investigates **704 international shipments** spanning **2024 to 2025**, mapping routes across key global maritime and freight hubs (such as Mumbai, Shanghai, Hamburg, Busan, New York, and London).

The core objective is twofold:
1. Conduct exploratory data analysis (EDA) to map correlation matrices across logistics financial metrics.
2. Build an advanced predictive modeling framework using **Scikit-Learn** to forecast shipment attributes and analyze feature impact weights.

## 🛠️ Tech Stack & Libraries
* **Language:** Python
* **Data Manipulation:** Pandas, NumPy
* **Data Visualization:** Seaborn, Matplotlib, Plotly Express
* **Machine Learning:** Scikit-Learn (`sklearn`)
* **Environment:** Jupyter Notebook / Google Colab

## 📊 Dataset Structure
The analytical pipeline evaluates a dataset consisting of `704 rows` and `12 features`:

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `shipment_id` | Object | Unique identifier for each freight movement |
| `type` | Object | Directional flow of trade (`Import` or `Export`) |
| `date` | DateTime | Transaction log date (Standardized to datetime format) |
| `product_category`| Category | Type of cargo (`Electronics`, `Textiles`, `Consumer Goods`, `Industrial Equipment`) |
| `origin` / `destination` | Category | Originating and concluding freight port cities |
| `O_Country` / `D_Country` | Category | Origin and Destination sovereign nations |
| `value` | Int64 | Valuation of the shipped cargo (USD) |
| `freight_cost` | Int64 | Capital expenditures allocated directly to transit fees |
| `customs_clearance_time_days`| Float64 | Total duration spent undergoing border security checks |
| `delivery_status` | Category | Final arrival timeline status (`On-Time` vs `Delayed`) |

## 🧠 Machine Learning & Predictive Modeling (Scikit-Learn)
To shift from reactive analysis to proactive intelligence, a predictive pipeline was implemented using **Scikit-Learn**:
* **Data Preprocessing:** Categorical encodings, feature scaling, and standard data splits (`train_test_split`) were utilized to establish robust training environments.
* **Model Implementation:** Evaluated multiple supervised learning algorithms to build mathematical target predictors.
* **Feature Optimization:** Applied log transformations (`inputs_logprediction`) to handle heavy skewness in shipping financial data and minimize structural performance metrics error.

## 📈 Key Analytical Insights
1. **Perfect Financial Scaling:** Statistical testing revealed a **1.00 Pearson Correlation Coefficient** between `value` and `freight_cost`. Freight expenditures match the raw economic valuation of the commodities perfectly.
2. **Customs Bottlenecks:** A robust positive correlation (**0.77**) exists between cargo values/freight costs and `customs_clearance_time_days`. Higher-value items, particularly *Industrial Equipment*, undergo more rigorous oversight.
3. **Operational Benchmarks:** * **Mean Value per Shipment:** $144,446.73 USD
   * **Mean Freight Cost:** $7,222.34 USD
   * **Average Customs Clearance Duration:** 3.74 Days (ranging from 1.5 to 5.9 days).

