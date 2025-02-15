create database Ola;
use Ola;

#1 Retrieve All Successfull Bookings
Create view Successfull_Bookings As
select * from bookings where Booking_Status="Success";
select * from Successfull_Bookings;

#2 Find avg ride distance for each vehicle type
Create view Avg_ride_distance_for_each_ride As
select Vehicle_Type, AVG(Ride_Distance) as avg_distance from bookings group by Vehicle_Type;
select * from Avg_ride_distance_for_each_ride;

#3 Get the total numbers of canceled rides by customers
Create view Total_no_of_rides_canceled_by_customer As
select count(*) from bookings where Booking_Status='Canceled by Customer';
select * from Total_no_of_rides_canceled_by_customer;

#4 List the top 5 customers who booked the highest number of rides
create view Top_5_customers_with_hightest_no_rides as
select Customer_ID, count(Booking_ID) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;
select * from Top_5_customers_with_hightest_no_rides;

#5 Get the number of rides cancelled by drivers due to personal and car-related issues
create view rides_canceled_by_driver as
select count(*) from bookings where Canceled_Rides_by_Driver='Personal and Car related issue';
select * from rides_canceled_by_driver;

#6 Find the maximum and minimum driver ratings for Prime Sedan bookings
create view max_and_min_driver_ratings_sedan as
select MAX(Driver_Ratings) as max_ratings, min(Driver_Ratings) as min_ratings from bookings where Vehicle_Type='Prime Sedan';
select * from max_and_min_driver_ratings_sedan;

#7 Retrieve all rides where payment was made using UPI
create view payment_upi as 
select * from bookings where Payment_Method='UPI';
select * from payment_upi;

#8 Find the average customer rating per vehicle type
create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as Average_Customer_Rating from bookings group by Vehicle_Type;
select * from avg_customer_rating;

#9 Find the total booking value of the rides completed sucessfully
create view Total_Successful_bookings as
select sum(Booking_Value) as total_successful_value from bookings where Booking_Status='Success';
select * from Total_Successful_bookings;

#10 List all incomple rides along with the reason
create view Incomplete_Rides as
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides='Yes';
select * from Incomple_Rides;