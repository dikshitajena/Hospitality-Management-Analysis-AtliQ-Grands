-- Total revenue realized --
select sum(revenue_realized) as Total_Revenue 
from fact_bookings;

-- Total Bookings --
select count(*) as Total_Bookings
from fact_bookings; 

-- Overall Occupancy% --
select (sum(successful_bookings)/sum(capacity))*100 as Occupancy_Rate
from fact_aggregated_bookings;

-- Average Ratings --
select avg(ratings_given) 
from fact_bookings;

-- Overall Cancellation Rate --
select ((select count(*) from fact_bookings
		where booking_status = "Cancelled") / count(*))*100 as Cancellation_Rate
from fact_bookings;

-- City having highest bookings --
select d.city, count(f.booking_id) as total_bookings 
from fact_bookings as f
join dim_hotels as d
on f.property_id = d.property_id
group by city
order by total_bookings desc
limit 1;

-- City having highest revenue --
select d.city, sum(revenue_realized) as total_revenue 
from fact_bookings as f
join dim_hotels as d
on f.property_id = d.property_id
group by city
order by total_revenue desc
limit 1;

-- Occupancy% by City --
select d.city, (sum(successful_bookings)/sum(capacity))*100 as Occupancy_Rate
from fact_aggregated_bookings as f
join dim_hotels as d
on f.property_id = d.property_id
group by d.city;

-- Cancellation% by City --
select d.city, ((select count(*) from fact_bookings
		         where booking_status = "Cancelled") / count(*))*100 as Cancellation_Rate
from fact_bookings as f
join dim_hotels as d
on f.property_id = d.property_id
group by d.city;

-- Avg Rating by City --
select d.city, avg(f.ratings_given)
from dim_hotels as d
join fact_bookings as f
on d.property_id = f.property_id
group by d.city;

-- Property having highest unbooked room nights --
select d.property_name, (sum(f.capacity) - sum(f.successful_bookings)) as Unbooked_rooms
from dim_hotels as d
join fact_aggregated_bookings as f
on d.property_id = f.property_id
group by d.property_name
order by Unbooked_rooms desc
limit 1;

-- Property having highest cancellation rate --
select d.property_name, ((select count(*) from fact_bookings
		         where booking_status = "Cancelled") / count(*))*100 as Cancellation_rate
from dim_hotels as d
join fact_bookings as f
on d.property_id = f.property_id
group by d.property_name
order by Cancellation_rate desc
limit 1; 

-- Revenue by Property --
select d.property_name, sum(f.revenue_realized) as Revenue
from dim_hotels as d
join fact_bookings as f
on d.property_id = f.property_id 
group by d.property_name;

-- Booking% by Platform --
select booking_platform, (count(*) / (select count(*) from fact_bookings))*100 as bookings_rate
from fact_bookings
group by booking_platform;

-- Most booking Platform --
select booking_platform, count(*) as bookings
from fact_bookings 
group by booking_platform
order by bookings desc 
limit 1;

-- Most revenue room category --
select room_category, sum(revenue_realized) as Total_revenue
from fact_bookings
group by room_category
order by Total_revenue desc
limit 1;

-- Bookings by Room category --
select room_category, count(*) as Total_bookings
from fact_bookings
group by room_category;






