# Hospitality-Management-Analysis-AtliQ-Grands
Analyzed booking and revenue data to find out the root causes behind revenue leakage for AtliQ Grands hotel chain and provided actionable recommendations to improve revenue generation. SQL and 3 page Power BI Report used to dig down insights.


# AtliQ Grands — Hospitality Revenue Analysis (₹2Bn Revenue | 25 Properties | 4 Cities)
An end-to-end data analysis project for AtliQ Grands, a hotel chain operating across 4 major cities. Using SQL for data investigation and Power BI for visualization, this project identifies key revenue leakage points — including high cancellation rates, underpriced high-demand markets, and untapped occupancy potential — and provides data-driven recommendations to improve overall revenue performance.

# Business Problem & Key Business Questions
AtliQ Grands, a hotel chain operating 25 properties across 4 major cities (Mumbai, Delhi, Bangalore, Hyderabad), wants to increase overall revenue and strengthen its market reputation. While the chain generated ₹2Bn in revenue from 135K bookings between May-July 2022, the management lacks visibility into where revenue is being lost, which properties are underperforming, and what drives booking and cancellation patterns across cities, platforms, and room categories.
## Questions Faced
- Which cities and properties are driving the most revenue, and which are underperforming?
- What is the overall occupancy rate, and how does it vary by city, property, and day type?
- What percentage of bookings are cancelled, and how much revenue is lost to cancellations?
- Which booking platforms contribute most to bookings, and is there an over-reliance on any single channel?
- Which room categories generate the most revenue, and is there an opportunity for upselling?
- How many room nights go unbooked daily, and what is the potential revenue opportunity?
- How are key metrics trending week over week and month over month?

# Project Workflow & Tools Used
1. Data Collection

Dataset provided by Codebasics (Hospitality Domain Project): 5 CSV files — dim_date, dim_hotels, dim_rooms, fact_aggregated_bookings, fact_bookings

2. Data Exploration & Cleaning

Explored all 5 tables in Excel to understand structure, identify primary/foreign keys, and detect data quality issues
Investigated missing values in ratings_given — determined they were structurally expected (Cancelled/No Show bookings have no ratings), so no imputation was applied
Validated revenue_realized logic (100% for Checked Out/No Show, 40% for Cancelled)

3. Data Investigation (SQL)

First used Power Pivot in Excel to create data model and do initial level investigation.
Used MySQL Workbench to run investigative queries — total revenue, occupancy %, cancellation rate, city-wise and property-wise performance, platform and room category analysis. The SQL script for the following is [here](hospitality-atliQ.sql).

4. Data Modeling (Power BI)

Imported all 5 CSV files into Power BI
Built a star schema with 6 relationships connecting fact tables to dim_date, dim_hotels, and dim_rooms

5. DAX Measures

Built 27 DAX measures including Occupancy %, ADR, RevPAR, Realisation %, Cancellation Rate, Booking % by Platform/Room Class, Week-over-Week and Month-over-Month change measures, and a custom "Unbooked Room Nights" measure

6. Dashboard Development

Built a 3-page interactive Power BI report — Performance Overview, Performance by Property, and Trend Analysis

7. Insights & Recommendations

Derived 10 key insights and 9 actionable recommendations with associated business risks

# Key Metrics
Occupancy % — Successful Bookings divided by Total Capacity, representing the percentage of available rooms that were booked.

ADR (Average Daily Rate) — Total Revenue divided by Total Bookings, representing the average revenue earned per booking.

RevPAR (Revenue Per Available Room) — Total Revenue divided by Total Capacity, representing revenue efficiency across all available rooms whether booked or not.

Cancellation Rate % — Cancelled Bookings divided by Total Bookings, representing the proportion of bookings that did not convert into stays.

Realisation % — Calculated as 1 minus (Cancellation Rate % + No Show Rate %), representing the proportion of bookings that successfully converted into completed stays.

Unbooked Room Nights — Daily Sellable Room Nights minus Daily Booked Room Nights, representing the number of rooms going empty on average per day, and quantifying the untapped revenue opportunity.

Booking % by Platform / Room Class — The contribution of each booking platform or room category to total bookings, calculated by comparing category-level bookings to the overall total.

Week-over-Week (WoW) and Month-over-Month (MoM) Change % — Measures comparing the current period's performance against the previous week or month for Revenue, Occupancy %, ADR, and Average Rating.

# Power BI Dashboard
The interactive Power BI report consists of 3 pages, each designed to answer a specific layer of the business problem.

## [Page 1](1.png) — Performance Overview
This page provides a high-level snapshot of overall business performance. It includes KPI cards for Revenue, Total Bookings, Occupancy %, Cancellation %, and Average Rating, along with city-wise breakdowns of Revenue, Occupancy %, and Average Ratings. It also shows Occupancy % by Day Type (weekday vs weekend), Booking % by Platform, and Total Bookings by Room Class.
## [Page 2](2.png) — Performance by Property
This page allows users to filter by property and city to deep-dive into individual property performance. It includes KPI cards for ADR, Unbooked Room Nights (Occupancy Gaps), RevPAR, and Realisation %, along with a chart showing Unbooked Room Nights by Property, Revenue by Category (Luxury vs Business), Average Ratings, and Potential by Room Class.
## [Page 3](3.png) — Trend Analysis
This page tracks performance over time using Month and Week slicers. It includes KPI cards showing % Change in Revenue, Occupancy %, and Average Rating from the previous month, along with weekly trend charts for Total Bookings vs Cancelled Bookings, ADR, and Revenue.

# Key Insights

1. The Delhi Paradox

Delhi has the highest occupancy rate, the highest average rating (3.78), and the highest cancellation rate (25.06%) — yet generates the least revenue among all four cities. This combination suggests strong customer demand and satisfaction are not translating into revenue, pointing to a pricing problem rather than a demand problem.

2. Cancellations Are Causing Significant Revenue Leakage

Nearly 1 in 4 bookings (24.83%) are cancelled across the portfolio. Since cancelled bookings only realize 40% of their value, this creates a substantial gap between revenue generated and revenue realized.

3. Occupancy Crisis at Select Properties

While the overall occupancy rate stands at 57.87%, four properties report occupancy as low as 44% — indicating localized demand generation issues rather than a chain-wide problem.

4. Weekend Occupancy Significantly Outperforms Weekdays

Weekend occupancy (74%) is substantially higher than weekday occupancy (51%), indicating strong weekend demand that may not be fully reflected in pricing.

5. Weekdays Drive More Bookings but Less Revenue

Despite weekdays generating a higher volume of bookings (~84K) compared to weekends (~50K), overall weekend revenue per booking is higher — suggesting an opportunity to better monetize weekday volume through targeted packages.

6. Platform Strategy Gap

"Others" is the single largest contributor to bookings, ahead of all named platforms. This indicates AtliQ Grands lacks a clear, identifiable channel strategy.

7. Room Category Mismatch — Standard vs Premium

Elite rooms perform best on both bookings and revenue. However, Standard rooms — the second highest in bookings — generate less revenue than Premium rooms despite having more bookings, indicating an upselling opportunity from Standard to Premium.

8. Late-July Revenue Decline Driven by Falling Bookings, Not Cancellations

By Week 32 (end of July), total bookings dropped sharply while cancellation rates remained consistent. This indicates the revenue decline was driven by reduced demand, not an increase in cancellations.

9. Inconsistent ADR Suggests Pricing Strategy Gaps

Average Daily Rate (ADR) fluctuates considerably week over week without a clear pattern, suggesting pricing decisions may benefit from a more structured, demand-based strategy.

10. Mumbai Is the Best Performing City

Mumbai leads across both volume and revenue — highest number of bookings (~43K) and highest total revenue among all four cities. This makes Mumbai the benchmark for what's working, and a model that other cities (especially Delhi) could be evaluated against.

# Recommendations

1. Continue Investment in Mumbai While Tapping Unutilized Potential

Mumbai is the strongest performing city — continued investment here is justified. However, even within Mumbai, unbooked room nights represent additional revenue opportunity worth capturing.

2. Drive Demand Generation at Low-Occupancy Properties

Properties with occupancy as low as 44% need targeted marketing campaigns and promotional offers to boost demand, rather than pricing adjustments alone.

3. Develop a Dedicated Pricing Strategy for Delhi

Given Delhi's combination of high demand, high ratings, and high cancellations but low revenue, a city-specific pricing review is needed to better align ADR with actual market demand.

4. Selectively Convert Standard Rooms to Premium

Given that Premium rooms generate more revenue with fewer bookings than Standard, converting a portion of Standard inventory to Premium could improve overall revenue without requiring additional bookings.

5. Leverage Luxury Category as a Revenue Driver

Since Luxury properties already contribute the majority of revenue (61.61%), this segment should be prioritized in future expansion or renovation investments.

6. Investigate the Late-July Booking Decline

The sharp drop in bookings during Week 32 should be investigated further — possible causes include seasonality, reduced marketing activity, or platform visibility issues — to prevent recurrence in future periods.

7. Review Cancellation Policy Against Revenue Standards

While the current 40% revenue recovery on cancellations aligns with common industry practice, it should be benchmarked against competitors to confirm it remains optimal.

8. Optimize Booking Platform Strategy

With "Others" generating the highest booking share, AtliQ Grands should identify which specific platforms fall under this category and build a more deliberate, trackable channel strategy.

9. Implement Weekend vs Weekday Pricing Strategy

Given the significant occupancy gap between weekends (74%) and weekdays (51%), a differentiated pricing approach — premium weekend rates and weekday promotional packages — could improve overall revenue.

# Risks

1. Pricing Adjustments Must Be Benchmarked Against Competitors

Any ADR increase, particularly in Delhi, should be evaluated against competitor pricing in the same market to avoid losing bookings to alternative hotels.

2. Room Conversion Should Be Partial and Data-Driven

Converting Standard rooms to Premium should be done gradually and based on demand data, to avoid alienating budget-conscious guests who specifically seek Standard rooms.

3. Cancellation Policy Changes Require Careful Evaluation

Since the current cancellation structure appears consistent with industry norms, any tightening of policy should be carefully evaluated against competitor practices to avoid discouraging bookings altogether.

# Conclusion

This project analyzed ₹2 bn in revenue across 25 properties and 4 cities for AtliQ Grands, uncovering three core revenue leakage points: a 24.83% cancellation rate, a pricing mismatch in high-demand markets like Delhi, and significant unbooked room capacity across several properties. Addressing these three areas — through targeted pricing, demand generation, and channel optimization — represents the clearest path for AtliQ Grands to convert existing demand into realized revenue without requiring additional customer acquisition.
Along with that fall in bookings investigation can help strategizing the demand generation in a much effective manner.

# Skills Demonstrated

- Data Exploration & Cleaning
- SQL
- Data Modeling
- DAX
- Power Pivot
- Data Visualization
- Business Analysis

# Author

DIKSHITA JENA

Aspiring Data/Business Analyst

Excel | SQL | Power BI

