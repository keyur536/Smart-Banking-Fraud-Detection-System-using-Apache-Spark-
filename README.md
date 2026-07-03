# Smart Banking Fraud Detection System using Apache Spark

This project is a big data analytics solution designed to detect fraudulent banking transactions using **Apache Spark (PySpark)**. It demonstrates the capabilities of PySpark for large-scale data processing, encompassing Resilient Distributed Datasets (RDDs), DataFrame operations, and Spark SQL to explore, manipulate, and analyze transaction records from various devices (ATM, Desktop, Mobile, POS).

## Technologies Used
- **Apache Spark (PySpark)**: Core engine for distributed data processing.
- **Python**: Programming language.
- **Jupyter Notebook**: Interactive environment for data analysis (`Fraud_Detection.ipynb`).
- **Docker**: For containerizing the PySpark environment and making it easy to run without local Spark setup.
- **Data Visualization**: `pandas`, `matplotlib`, and `seaborn` for exploratory data analysis.

## Dataset
The project analyzes synthetic transaction data split into four CSV files located in the `dataset/` directory:
- `transactions_ATM.csv`
- `transactions_Desktop.csv`
- `transactions_Mobile.csv`
- `transactions_POS.csv`

The dataset includes rich features like `Customer_ID`, `Transaction_Amount`, `Transaction_Type`, `Merchant_Category`, `Device_Type`, and an `Is_Fraud` flag.

## Key Features & Operations
The `Fraud_Detection.ipynb` notebook covers the following stages of data analysis:
1. **Spark Initialization & Data Loading**: Loading multiple CSVs into a single Spark DataFrame and inferring the schema.
2. **RDD Implementation**: 
   - Filtering fraudulent transactions.
   - Using `map`, `reduceByKey`, and `sortBy` to calculate and rank total fraud amounts per customer.
   - Managing RDD persistence (caching) for performance optimization.
3. **DataFrame Operations**: 
   - Selecting and filtering high-value transactions.
   - Grouping and aggregating data by account types.
   - Joining transaction details with customer information dataframes.
4. **Exploratory Data Analysis (EDA) & Spark SQL**: 
   - Registering DataFrames as temporary views.
   - Executing SQL queries to uncover top fraud patterns and insights.

## How to Run the Project

### Method 1: Using Docker (Recommended)
The easiest way to run this project is via Docker, as it handles the PySpark and Jupyter installation for you.

1. **Build the Docker Image**:
   Open your terminal in the project root and run:
   ```bash
   docker build -t spark-fraud-detection .
   ```

2. **Run the Docker Container**:
   Start the container and expose the Jupyter Notebook port:
   ```bash
   docker run -p 8888:8888 spark-fraud-detection
   ```

3. **Access the Notebook**:
   Check the terminal output for the Jupyter Server URL (usually `http://127.0.0.1:8888/lab?token=...`). Open that URL in your browser and click on `Fraud_Detection.ipynb` to start running the cells.

### Method 2: Local Setup
If you prefer not to use Docker, ensure you have Java, Python, and Apache Spark installed on your machine.
1. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   pip install pyspark
   ```
2. Launch Jupyter Notebook from the project root:
   ```bash
   jupyter notebook
   ```
3. Open `Fraud_Detection.ipynb` and run the cells.

## Project Structure
```text
smart-banking-fraud-detection/
│
├── dataset/                     # Contains the transaction CSV files
│   ├── transactions_ATM.csv
│   ├── transactions_Desktop.csv
│   ├── transactions_Mobile.csv
│   └── transactions_POS.csv
│
├── Screenshot/                  # Screenshots demonstrating Docker setup
│
├── Dockerfile                   # Docker configuration for PySpark environment
├── Fraud_Detection.ipynb        # Main Jupyter Notebook with data analysis
├── requirements.txt             # Python dependencies
└── README.md                    # Project documentation
```
