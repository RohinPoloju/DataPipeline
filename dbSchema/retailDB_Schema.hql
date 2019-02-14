drop database if exists ingestDB;

--creating database ingestDB

create database ingestDB;
use ingestDB;

--Departments

create table departments(
dept_id int,
dept_name string )
row format delimited
fields terminated by ','
lines terminated by '\n';

--Products

create table products(
product_id int,
product_category int,
product_name string,
product_description string,
product_price float,
product_image string
)
row format delimited
fields terminated by ','
lines terminated by '\n';

--Customers

create table customers(
    cust_id int,
	cust_firstName string,
	cust_LastName string,
	cust_email string,
	cust_Password string,
	cust_Street string,
	cust_City string,
	cust_State string,
	cust_zipcode string
)
row format delimited 
fields terminated by ','
lines terminated by '\n';


--Orders

create table orders(
    order_id int,
    order_date timestamp,
    order_customer_id int,
    order_status string
)
row format delimited 
fields terminated by ','
lines terminated by '\n';

create table order_items(
    order_item_id int,
    order_item_order_id int,
    order_item_product_id int,
    order_item_quantity int,
    order_item_subtotal float,
    order_item_product_price float
)
row format delimited 
fields terminated by ','
lines terminated by '\n';

--Categories

create table categories(
    category_id int,
    category_dept_id int,
    category_name string
)
row format delimited 
fields terminated by ','
lines terminated by '\n';

