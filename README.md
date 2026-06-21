# 🛒 Online Shop Database

Welcome to the **Online Shop MySQL Database** project!  
A full-featured e-commerce database simulation, complete with **users, products, categories, orders, order items, reviews, and payments**.

## 🎯 Project Highlights

✨ **Automatic Order Management**  
⚡ **Triggers for stock & total price updates**  
📊 **Views for fast queries and reporting**  
🔍 **Indexes for optimized performance**  
🛡️ **Transaction-safe operations**  

## 📂 Project Structure

### SQL Files & Their Purpose

- **`create_tables.sql`**  
  Sets up all tables with **primary & foreign keys**, defining the relationships between users, products, orders, and more.

- **`procedure.sql`**  
  Contains the **stored procedure** that creates orders automatically and integrates with triggers.

- **`triggers.sql`**  
  Automates key processes:
  - Checks stock before inserting order items  
  - Reduces stock after insertion  
  - Updates total price  
  - Restores stock & recalculates total after deletions

- **`views.sql`**  
  Simplifies data access with:
  - Orders summary  
  - Product availability  
  - User order statistics

- **`sample_data.sql`**  
  Pre-filled sample data to **quickly test** the system and see triggers & procedures in action.

## ⚡ Key Features

- ✅ Fully **automated order creation**  
- ✅ **Stock management** via triggers  
- ✅ **Automatic total price calculation**  
- ✅ **Views & indexes** for reporting & speed  
- ✅ **Error handling** & transaction safety

## 📝 Recommended Workflow

1. Import tables  
2. Import stored procedure  
3. Import triggers  
4. Import views  
5. Load sample data  
6. Test procedures and triggers  
7. Query using views & indexes  

## 💡 Quick Tips

- Always check product stock before creating large orders  
- Use views for summaries and reporting  
- Indexes improve performance on large datasets  
- Sample data demonstrates all core features  

## 📧 Connect with Me

📩 **Email:** amirhossin6825@gmail.com  
💬 **Telegram:** [@AmirHossin6825](https://t.me/AmirHossin6825)  

> 🎉 Enjoy exploring and experimenting with this fully-featured Online Shop Database!
