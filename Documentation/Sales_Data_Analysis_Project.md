
💼 Sales Data Analysis Project

📊 Overview
This project showcases an in-depth analysis of sales data using SQL for data transformation and Power BI for interactive visualizations. The goal was to derive key business insights from customer, product, and geography data, supporting data-driven decision-making through a well-structured BI solution.

By leveraging SQL for backend data modeling and Power BI for frontend storytelling, the dashboard uncovers trends in revenue, profit, customer segments, and regional performance across multiple years.

🎯 Purpose
The primary objective of this project is to:

- Understand sales patterns across products and regions
- Identify high-performing customers and products
- Analyze customer behavior and segmentation
- Support strategic decisions in marketing, inventory, and customer engagement

❓ Business Key Questions Answered

- What is the overall revenue, profit, and order volume across different years?
- Which products and customers are driving the most value?
- How do sales vary by region, income group, and occupation?
- Which countries and cities generate the highest orders?
- How is customer behavior evolving over time?

⚙️ Features & Functionality
This Power BI report incorporates several advanced features for flexibility, interactivity, and enhanced storytelling:

- **Field Parameters**: Used in line charts to switch between KPIs like Net Revenue, Profit, and Orders by month.
- **Custom Navigation**: Symbol-based page navigation with bookmarks for seamless transitions.
- **KPI Cards & Tooltips**: Offer quick comparative views (current vs previous) across key metrics.
- **Dynamic Filtering**: Users can filter by year, region, country, occupation, and income level.
- **Interactive Maps**: Visualize order distribution globally using proportional bubbles.
- **Clear Filter Button**: Quickly reset filters for a fresh view on any page.
- **Insight Buttons**: Highlight contextual narratives such as customer-driven revenue contributions.

🔍 Key Business Insights

📈 Sales Performance (Main Dashboard)

- **Total Revenue of $306M and Profit of $126M generated from 26.7K orders.**
- Extra Charges (tax & freight) amounted to $3.1M.
- A significant surge in revenue and profit was seen between July 2007 and July 2008, after a relatively stable period from July 2005 to 2007.
- **The top-selling product, Water Bottle - 30 oz**, alone contributed **4.1K** orders, followed by Patch kit/8 Patches (3K) and Mountain Tire Tube (2.9K).
- **Current month revenue stood at $20.05M with 2,195 orders, compared to the previous month’s $19.94M and 2,206 orders.**

🗺️ Regional Distribution (Map Dashboard)

- **The United States led with 9,201 orders**, far outpacing Germany (2,412 orders) and France (2,411 orders).
- Filters allow users to focus on specific regions like North America, Europe, and Pacific to explore localized performance.

👥 Customer Analytics (Customer Dashboard)

- **The business served a total of 17.9K customers, with an average revenue of $17.1K per customer**.
- Customer activity saw a noticeable increase post-July 2007, continuing strong into 2008.
- Among occupations, Professionals contributed the highest number of orders (8K), followed by Skilled Manual (6K) and Management (5K).
- Orders were evenly split across Low Income and Medium Income groups (each ~12K orders), while High Income accounted for 3K orders.
- In 2008, Joy Ramos, a professional, was the top customer by revenue contribution.

## 📂 Project Structure

Sales-Data-Analysis/  
├── Datasets/  
│   ├── Customer.csv  
│   ├── Product.csv  
│   ├── Sales.csv  
│   ├── Geography.csv  
│   ├── Date.csv  
│   └── SalesTerritory.csv  
│  
├── Documentation/  
│   └── Sales_Data_Analysis.md  
│  
├── Files/  
│   ├── PowerBI_SalesProject.pbix  
│   ├── SQL_project_setup.sql  
│   └── SQL_query.sql  
│  
├── Images/  
│   ├── Main_Dashboard.png  
│   ├── Maps.png  
│   ├── Customer.png  
│   ├── PowerBI_Schema.png  
│   └── SQL_ERR_diagram.png  
│  
└── README.md



## ✅ Conclusion
This Sales Data Analysis project effectively demonstrates how combining SQL-based data processing with Power BI visual storytelling can provide actionable insights. With deep analysis into revenue patterns, customer behavior, and regional performance, this solution empowers businesses to optimize their strategies for growth, targeting, and customer retention.
