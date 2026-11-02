
import pandas as pd

# 1. Load all four datasets
customers = pd.read_csv("customers.csv")
products = pd.read_csv("products.csv")
orders = pd.read_csv("orders.csv")
order_details = pd.read_csv("order_details.csv")

print("\n========== CUSTOMER ANALYSIS ==========")

# 2. Display customer data
print(customers.head())

# 3. Check missing values
print("\nMissing Values:")
print(customers.isnull().sum())

# 4. Check duplicate records
print("\nDuplicate Records:")
print(customers.duplicated().sum())

# 5. Count customers by city
print("\nCustomers by City:")
print(customers["City"].value_counts())


print("\n========== PRODUCT ANALYSIS ==========")

# 6. Analyse product prices
print("\nProduct Price Statistics:")
print(products["Price"].describe())


print("\n========== DATA MERGING ==========")

# 7. Merge order details with products
product_details = order_details.merge(
    products,
    on="Product_ID",
    how="left"
)

# 8. Calculate revenue
product_details["Revenue"] = (
    product_details["Quantity"] * product_details["Price"]
)

# 9. Merge with orders to get order status
final_data = product_details.merge(
    orders[["Order_ID", "Status"]],
    on="Order_ID",
    how="left"
)

print("\nMerged Dataset:")
print(final_data.head())


print("\n========== OVERALL REVENUE ANALYSIS ==========")

# 10. Revenue by product (all order statuses)
print("\nRevenue by Product - All Orders:")

print(
    final_data.groupby("Product_Name")["Revenue"]
    .sum()
    .sort_values(ascending=False)
)


print("\n========== DELIVERED ORDER ANALYSIS ==========")

# 11. Filter only delivered orders
delivered_data = final_data[
    final_data["Status"] == "Delivered"
].copy()

# 12. Revenue by product - delivered orders only
print("\nRevenue by Product - Delivered Orders:")

delivered_revenue = (
    delivered_data.groupby("Product_Name")["Revenue"]
    .sum()
    .sort_values(ascending=False)
)

print(delivered_revenue)

# 13. Total delivered revenue
total_revenue = delivered_data["Revenue"].sum()

print("\nTotal Delivered Revenue:")
print(total_revenue)

# 14. Total delivered quantity
total_quantity = delivered_data["Quantity"].sum()

print("\nTotal Delivered Quantity:")
print(total_quantity)


print("\n========== EXPORT ANALYSIS ==========")

# 15. Export complete product analysis
final_data.to_csv(
    "product_revenue_analysis.csv",
    index=False
)

# 16. Export delivered product analysis
delivered_data.to_csv(
    "delivered_product_revenue_analysis.csv",
    index=False
)

print("\nBoth CSV files exported successfully!")
