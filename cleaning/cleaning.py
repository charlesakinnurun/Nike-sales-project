import pandas as pd
import numpy as np

# Load data
df = pd.read_csv(r'dataset/Nike_Sales_Uncleaned.csv')

# Standardize date formats
df['Order_Date'] = pd.to_datetime(df['Order_Date'], errors='coerce', dayfirst=False, infer_datetime_format=True)

# Remove duplicates
df = df.drop_duplicates()

# Convert numeric columns
num_cols = ['Units_Sold', 'MRP', 'Discount_Applied', 'Revenue', 'Profit']
for col in num_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Remove rows with negative or zero Units_Sold (if not returns)
df = df[df['Units_Sold'].fillna(0) > 0]

# Drop rows with missing essential fields
df = df.dropna(subset=['Order_ID', 'Order_Date', 'Product_Name'])

# Fill missing numeric values with 0
df[num_cols] = df[num_cols].fillna(0)

# Standardize categorical columns
cat_cols = ['Gender_Category', 'Product_Line', 'Product_Name', 'Size', 'Sales_Channel', 'Region']
for col in cat_cols:
    df[col] = df[col].astype(str).str.lower().str.strip()

# Save cleaned data
df.to_csv(r'dataset/Nike_Sales_Cleaned.csv', index=False)

print("Data cleaned and saved to dataset/Nike_Sales_Cleaned.csv")