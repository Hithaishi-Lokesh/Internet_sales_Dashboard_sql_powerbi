Business Requirement

The sales manager, focusing on enhancing internet sales reports with visual dashboards


Key Points from the Business Request

Objective: Transition from static reports to visual dashboards.

Focus Areas:
Sales data: What products were sold to which clients over time.
Ability for salespeople to filter data by their products and customers.

Data Sources:
Sales data from FactstoreSales.
Customer data from dimCustomers.

Budget data from a new Excel spreadsheet for 2021.

Analysis Timeline: Include data for two years in the analysis, but the budget will only be for one year.

Necessary Systems: Power BI and a CRM system.

Business Demand Overview----

Reporter: Sales Manager
Value of Change: Visual dashboards for improved sales reporting.
Necessary Systems: Power BI, CRM system.
Relevant Info: 2021 budget provided in Excel.

User Stories
As a Sales Manager:
I want a dashboard overview of internet sales so that I can identify which customers and products are performing best. (Acceptance Criteria: Dashboard updates daily)
As a Sales Representative:
I want a detailed overview of internet sales by customer to follow up with top buyers. (Acceptance Criteria: Dashboard allows data filtering for each customer)
As a Sales Representative:
I want a detailed overview of internet sales by product to track performance. (Acceptance Criteria: Dashboard allows data filtering for each product)
As a Sales Manager:
I want a dashboard to compare internet sales over time against the budget. (Acceptance Criteria: Dashboard includes graphs and KPIs)

Next Steps
Data Cleaning: Identify tables needed for data cleansing and transformation.
Dashboard Creation: Use the user stories and acceptance criteria to guide dashboard development.
User Feedback: Ensure users can review and validate acceptance criteria post-implementation.

Project activity :

Focus on - transforming and cleaning data while referring to user story and business demand 

Analysing the difference between Fact Table and dimension table, we will identity required tables based on business requirement and user story 

In data warehousing and database design, fact tables and dimension tables are fundamental concepts, often used together in star or snowflake schemas. Here’s a breakdown of each:

Fact Table
Definition: A fact table is a central table in a star schema of a data warehouse. It contains quantitative data for analysis and is often denormalized.
Characteristics:
Measures: It stores numeric data or measurements, such as sales amount, quantities sold, profit, etc.
Keys: It typically contains foreign keys that reference dimension tables (e.g., customer ID, product ID, date ID).
Granularity: The level of detail; for example, sales data could be at the transaction level (each sale) or aggregated (monthly sales).
Example: A FactstoreSales table that records sales transactions, with columns for sales amount, quantity, customer ID, and date.
Dimension Table
Definition: A dimension table contains attributes that describe the objects in the fact table. It provides context to the facts and is generally denormalized.
Characteristics:
Descriptive Attributes: It includes textual or categorical data, such as product names, customer demographics, or dates.
Primary Keys: Each dimension table has a primary key that uniquely identifies each record, which is referenced by the fact table.
Hierarchies: Dimensions often contain hierarchies that allow for data to be analyzed at different levels (e.g., year → quarter → month).
Example: A dimCustomers table that includes customer IDs, names, addresses, and other demographic information.
Key Differences
Purpose: Fact tables store measurable, quantitative data; dimension tables store descriptive, contextual information.
Data Type: Fact tables primarily contain numerical data; dimension tables contain qualitative data.
Structure: Fact tables are usually larger and contain more rows; dimension tables are smaller and contain more columns with descriptive attributes.
Relationships: Fact tables reference dimension tables through foreign keys to establish relationships for analysis.
Summary
In a typical data analysis scenario, the fact table provides the data you want to analyze, while dimension tables give context to that data, allowing for meaningful insights through querying and reporting.


Key Performance Indicators (KPIs) in Power BI. Here are the key points covered:

Definition of KPI: A KPI is a visual cue that shows progress toward a measurable goal, helping organizations track whether they are on track to meet their objectives.

Purpose: KPIs help answer the question of whether you are ahead or behind on your goals. They measure the distance to a target.

Examples: The video uses examples like tracking sales targets and recruitment goals to illustrate how KPIs can be applied in real business scenarios.

Power BI Demo: It showcases how to create KPIs in Power BI using a sales model, highlighting how visualizations can clearly indicate whether targets are being met (using colors like red and green for visual feedback).

Visualization Options: Besides KPIs, the video mentions using gauge charts as another way to represent performance against targets.

Decision-Making: The main goal of using KPIs is to facilitate informed decision-making based on real-time data.

The video emphasizes the importance of tracking these indicators to take timely actions to achieve business goals.

In Power BI, when setting up a KPI visual, you need to provide the following:

Value: This is the current measure you want to evaluate. For example, this could be your actual sales amount or total revenue.

Target: This represents the goal you want to achieve. It could be a specific number, like a sales target for the month (e.g., $173,000).

Trend: This indicates the direction of progress toward the target. It can be a measure that shows historical data or a calculated measure that reflects performance over time, like cumulative sales to date.

In Power BI, if you set up a KPI where:

Value: This represents your budget for the current year.
Target: You have set a target of $10 million.
Trend: The trend is evaluated by year, showing how your budget compares over time.
KPI Explanation:
Value: The actual budget figure for the current year, which you will monitor to see how it stacks up against your target. For example, if your current budget for this year is $8 million, that is the value displayed.

Target: The target is set at $10 million, meaning that by the end of the year, your goal is to have the budget reach this amount. This is a benchmark against which you will measure performance.

Trend: This shows how your budget has performed over previous years. You might visualize this through a line chart or a bar chart that indicates whether your budget has been increasing, decreasing, or remaining stable over time. For example, if last year’s budget was $9 million and the year before it was $7 million, the trend would show an upward trajectory.
