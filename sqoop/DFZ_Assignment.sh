# This is task to create a sqoop job to import data from mysql to HDFS
# retail_db is a database in MySQL
# Hadoop/HDFS is running on the cloudera quickstart VM
# The retail_db contains 6 tables, sqoop jobs are created to import each table into HDFS.
# mysql-connector-java.jar should be placed in /user/lib/sqoop/lib from /var/lib/sqoop
# give 777 permissions for the jar file
# only one mapper is used for simplicity

'
# file structure to import data
hadoop fs -rm -R /user/cloudera/sqoop_import

hadoop fs -mkdir /user/cloudera/sqoop_import
hadoop fs -mkdir /user/cloudera/sqoop_import/retailDB

sqoop job --delete customerImport
sqoop job --delete orderImport
sqoop job --delete departmentImport
sqoop job --delete orderItemsImport
sqoop job --delete productImport
sqoop job --delete categoriesImport


# orders Sqoop job
sqoop job \
--create orderImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table orders \
--target-dir /user/cloudera/sqoop_import/retailDB/orders 

# categories
sqoop job \
--create categoriesImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table categories \
--target-dir /user/cloudera/sqoop_import/retailDB/categories

# products 
sqoop job \
--create productImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table products \
--target-dir /user/cloudera/sqoop_import/retailDB/products

# departments
sqoop job \
--create departmentImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table departments \
--target-dir /user/cloudera/sqoop_import/retailDB/departments

# order_items
sqoop job \
--create orderItemsImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table order_items \
--target-dir /user/cloudera/sqoop_import/retailDB/order_items

# customers
sqoop job \
--create customerImport \
-- import --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--table customers \
--target-dir /user/cloudera/sqoop_import/retailDB/customers

sqoop job --list
sqoop job --exec customerImport
sqoop job --exec orderImport
sqoop job --exec departmentImport
sqoop job --exec orderItemsImport
sqoop job --exec productImport
sqoop job --exec categoriesImport
'

# Deleting the previous file structure if exists 
hadoop fs -rm -R /user/cloudera/sqoop_import

#Creating A file structure to import data 
hadoop fs -mkdir /user/cloudera/sqoop_import
hadoop fs -mkdir /user/cloudera/sqoop_import/retailDB

sqoop job --delete allTableImport

# This sqoop job import all the tables 
sqoop job \
--create allTableImport \
-- import-all-tables --connect jdbc:mysql://quickstart:3306/retail_db \
--username retail_dba \
--password cloudera \
--direct \
--warehouse-dir /user/cloudera/sqoop_import/retailDB \
--as-textfile
-m 1

# sqoop job --list
sqoop job --exec allTableImport 
































