Create View Successful_Booking as 
-- Retrieve all successful bookings:
select * from bookings where Booking_Status = 'Success'

select * from Successful_Booking;

-- Find the average ride distance for each vehicle type:
create View ride_distance_for_each_vehicle as 
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from bookings group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- Get the total number of cancelled rides by customers:
create View cancelled_rides_by_customers AS
select count(*) from bookings where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;

-- List the top 5 customers who booked the highest number of rides:
create View highest_number_of_rides AS
select customer_id, count(booking_id) as total_rides from bookings group by customer_id order by total_rides desc limit 5; 

select * from highest_number_of_rides;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:
create view P_C_Issues AS
select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from P_C_Issues;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Ratings AS
select max(driver_ratings), min(driver_ratings) from bookings where vehicle_type = 'Prime Sedan';

select * from Max_Min_Driver_Ratings;

-- Retrieve all rides where payment was made using UPI:
create view Payment_UPI AS
select * from bookings where Payment_Method = 'UPI';

select * from Payment_UPI;

-- Find the average customer rating per vehicle type:
create view customer_rating_per_vehicle_type AS
select Vehicle_Type, AVG(Customer_Rating) as Avg_Rating from bookings group by Vehicle_Type order by Avg_Rating desc;

select * from customer_rating_per_vehicle_type;

-- Calculate the total booking value of rides completed successfully:
create view total_booking_value_of_rides AS
select sum(Booking_Value) from Successful_Booking;

select * from total_booking_value_of_rides;

-- List all incomplete rides along with the reason
create View incomplete_rides_reason AS
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides  = 'Yes';

select * from incomplete_rides_reason;