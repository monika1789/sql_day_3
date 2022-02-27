--1. List all customers who live in Texas (use
--JOINs)

SELECT customer.first_name,customer.last_name,address.district
FROM customer 
FULL JOIN address
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT customer.first_name, customer.last_name, customer.customer_id,payment.amount  
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id 
WHERE amount > 6.99



--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT  first_name, last_name, customer_id 
FROM customer
WHERE customer_id in (
     SELECT customer_id
     FROM payment
     GROUP BY  customer_id 
     HAVING sum(amount) > 175
     ORDER BY sum(amount) DESC
);

--4. List all customers that live in Nepal (use the city
--table)
SELECT customer.first_name,customer.last_name,country 
FROM customer
FULL JOIN address 
ON customer.address_id = address.address_id 
FULL JOIN city 
ON address.city_id = city.city_id 
FULL JOIN country
ON city.country_id  = country.country_id 
WHERE country ='Nepal';


--5. 5. Which staff member had the most
--transactions?
SELECT  count(payment.amount), staff.first_name,staff.last_name 
FROM payment 
FULL JOIN staff 
ON staff.staff_id = payment.staff_id 
GROUP BY  staff.first_name, staff.last_name 
ORDER BY count(payment.amount) DESC;


--6. How many movies of each rating are
--there?
SELECT rating, count(rating)
FROM film
GROUP BY  rating 
ORDER BY count(rating) DESC;



--7 Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
SELECT  first_name, last_name, customer.customer_id,payment.amount
FROM customer
FULL JOIN payment 
ON customer.customer_id = payment.customer_id 
WHERE payment.amount in (
     SELECT amount
     FROM payment
     group by amount
     HAVING count(amount) = 1 and amount > 6.99
     ORDER BY count(amount) DESC
);


--8. How many free rentals did our stores give away?
SELECT rental_id
FROM payment 
WHERE amount = 0.00










