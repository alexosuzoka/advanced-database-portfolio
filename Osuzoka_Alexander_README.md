Parkview Astoria Hotel (PAH) – Advanced Database Systems Portfolio

Project Overview

This project presents the design, implementation, optimisation, and deployment of a relational and cloud-based database system for Parkview Astoria Hotel (PAH).

The project develops the Parkview Astoria Hotel Reservation System (PAH-HRS), a database solution designed to support hotel operations, including guest registration, room management, reservations, payments, booking confirmation, room availability tracking, and cloud database deployment.

The portfolio demonstrates practical applications of advanced database concepts using Microsoft SQL Server, MongoDB, and MongoDB Atlas.

Table of Contents

Hotel Description

Hotel Room Suites

Technologies Used

Portfolio 1 – Database Design and Modelling

Portfolio 2 – Query Processing and Optimisation

Portfolio 3 – Transactions and Concurrency

Portfolio 4 – NoSQL and Advanced Data Models

Portfolio 5 – Distributed and Cloud Database Exercise

MongoDB Video Demonstrations

Challenges Encountered with MongoDB Atlas

Learning Outcomes

Repository Structure

Hotel Description

Parkview Astoria Hotel (PAH) is the fictional hospitality establishment used as the case study for this database project.

The hotel reservation system is designed to manage its operational data efficiently and maintain accurate relationships between guests, room types, individual rooms, payments, and bookings.

The database supports the following business activities:

Guest registration and management.

Room and suite classification.

Room pricing and availability management.

Reservation and booking processing.

Payment recording and verification.

Booking confirmation following successful payment.

Tracking rooms that are available, occupied, or undergoing maintenance.

Monitoring the number of available and occupied rooms.

Cloud database configuration and deployment.

The database is called PAH-HRS.

Hotel Room Suites

Parkview Astoria Hotel offers five room categories in the database.

Room Type ID

Room/Suite Category

Price per Night

DS

Deluxe Suite

₦100,000

LDS

Luxury Deluxe Suite

₦150,000

ES

Executive Suite

₦200,000

DIS

Diplomatic Suite

₦250,000

TB

Twin Bed

₦50,000

The room prices above reflect the sample data used in the transaction and concurrency portfolio.

1. Deluxe Suite (DS)

The Deluxe Suite is a standard premium accommodation category intended for guests seeking comfortable hotel accommodation.

2. Luxury Deluxe Suite (LDS)

The Luxury Deluxe Suite is a higher-priced accommodation category offering a more luxurious stay.

3. Executive Suite (ES)

The Executive Suite is designed for executive travellers and guests requiring premium accommodation.

4. Diplomatic Suite (DIS)

The Diplomatic Suite is the highest-priced suite category in the sample database and represents an exclusive accommodation option.

5. Twin Bed (TB)

The Twin Bed category accommodates guests requiring a room with twin sleeping arrangements.

Room Inventory Management

Each room is assigned a room type and an availability status.

The room availability statuses are:

Available: The room can be reserved.

Occupied: The room is currently assigned to a guest.

Maintenance: The room is temporarily unavailable due to maintenance.

The system also tracks the total number of rooms, available rooms, occupied rooms, and rooms undergoing maintenance for each room type.

Technologies Used

Technology

Purpose

Microsoft SQL Server

Relational database management

SQL / T-SQL

Database creation, queries, transactions, and data manipulation

SQL Server Management Studio (SSMS)

Database administration and query execution

MongoDB

NoSQL database implementation

MongoDB Atlas

Cloud database hosting

MongoDB for VS Code

MongoDB Playground and script execution

GitHub

Version control and project documentation

Portfolio 1 – Database Design and Modelling

Folder: portfolio-1-database-design/

This portfolio focuses on the conceptual and logical design of the Parkview Astoria Hotel Reservation System.

Deliverables

Parkview Astoria Hotel.docx

Screenshot_ER_Diagram_Objects.png

Database Design

The database design identifies the major entities required to manage hotel operations and establishes relationships between them.

The ER diagram provides a visual representation of the database objects, their attributes, and their relationships.

The design supports:

Guest registration.

Room type classification.

Room inventory management.

Room payments.

Hotel reservations.

Booking status management.

Primary keys uniquely identify records, while foreign keys maintain referential integrity between related entities.

Portfolio 2 – Query Processing and Optimisation

Folder: portfolio-2-query-optimization/

This portfolio demonstrates SQL data manipulation, room availability queries, booking processing, and query execution plans.

SQL Scripts and Their Functions

SQL Script

Description

insert_room_types.sql

Inserts five room categories, their prices, total room counts, and initial availability statistics.

insert_rooms.sql

Inserts sample rooms and assigns room types and availability statuses.

insert_room_payments.sql

Inserts sample guest payments, payment methods, amounts, and payment statuses.

select_rooms.sql

Retrieves room records from the rooms table.

select_room_payments.sql

Retrieves records from the room payments table.

retrieve_new_users.sql

Retrieves newly registered guest records.

query_room_availability.sql

Uses an INNER JOIN between rooms and room types to display available rooms, room categories, prices, and availability.

query_room_availability_checker.sql

Uses a RIGHT JOIN between rooms and room types to check available rooms and display room type inventory information.

query_booking_status.sql

Implements booking creation, payment verification, booking confirmation, and room inventory updates within a SQL transaction.

Booking Status Processing

The booking status script demonstrates a hotel booking workflow.

A guest makes a room payment.

The system retrieves the guest's payment details.

A booking record is created with an initial Pending status.

The payment status is checked.

If payment is successful, the booking is updated to Confirmed.

The number of available rooms is reduced.

The number of occupied rooms is increased.

The transaction is committed.

This approach helps ensure that booking records and room inventory remain consistent.

Query Execution Plans

The portfolio also includes execution plan files:

execution_plan_hrs_insert_objects.sqlplan

execution_plan_br_booking_status.sqlplan

These files capture SQL Server execution plans for database operations and provide evidence for examining query execution behaviour and performance.

Screenshots document the insertion of data, query results, and booking status operations.

Portfolio 3 – Transactions and Concurrency

Folder: portfolio-3-transaction-concurrency/

This portfolio demonstrates transaction processing and concurrency management in SQL Server.

SQL Script

query_trans_commit_insert_objects.sql

Operations Performed

The script:

Configures Read Committed Snapshot Isolation.

Enables Snapshot Isolation.

Begins a transaction named hrs_insert_objects.

Inserts sample guest records.

Inserts room type records.

Inserts room records.

Inserts room payment records.

Commits the transaction.

Transaction Management

The transaction ensures that the grouped database operations are committed together.

If an operation fails before the transaction commits, the transaction can be rolled back to prevent incomplete data insertion.

Concurrency and Isolation Levels

The portfolio demonstrates the use of:

Read Committed Snapshot Isolation (RCSI).

Snapshot Isolation.

Transaction boundaries.

COMMIT operations.

Consistent database reads.

The isolation-level screenshot demonstrates the booking-status query under different isolation settings.

This portfolio highlights the importance of managing concurrent database operations in a hotel reservation system, particularly where room availability and booking status can change simultaneously.

Portfolio 4 – NoSQL and Advanced Data Models

Folder: portfolio-4-nosql/

This portfolio implements selected hotel reservation operations using MongoDB.

The MongoDB database is named PAH-HRS.

MongoDB Collections

The MongoDB implementation uses collections corresponding to the relational database tables:

guests

rooms

room_types

room_payments

bookings

These collections store guest details, room information, room classifications, payment records, and reservations as MongoDB documents.

MongoDB Operations Performed

1. Room Availability Aggregation

Files:

mongodb_room_availability_code.txt

mongodb_room_availability_code_through_aggregration.json

The room availability aggregation pipeline performs the following operations:

Aggregation Stage

Function

$match

Filters rooms with an availability status of Available.

$lookup

Joins the rooms collection with the room_types collection using room_type_id.

$unwind

Expands the joined room type information into individual documents.

$project

Displays selected fields, including room ID, availability status, room type, available room count, and room price.

The result provides a consolidated view of available hotel rooms and their associated room type information.

2. MongoDB Booking Status Processing

File: mongo_db_booking_status.js

This script reproduces the booking status workflow using MongoDB operations.

The script:

Connects to the PAH-HRS database.

Retrieves the rooms, bookings, room_types, and room_payments collections.

Defines the guest ID, room ID, check-in date, and check-out date.

Retrieves the selected room from the rooms collection.

Retrieves the guest's payment record.

Creates a booking document with an initial Pending status.

Checks whether the payment status is Paid.

Updates the booking status to Confirmed if payment has been completed.

Updates room inventory counts using $inc.

The MongoDB operations include:

findOne() – Retrieves individual room and payment documents.

insertOne() – Creates a new booking document.

updateOne() – Updates the booking status.

$set – Sets the booking status to Confirmed.

$inc – Increases occupied room counts and decreases available room counts.

The implementation demonstrates how MongoDB can support hotel booking workflows using document-based storage and update operations.

Portfolio 5 – Distributed and Cloud Database Exercise

Folder: portfolio-5-distributed-cloud/

This portfolio focuses on deploying and configuring a MongoDB database using MongoDB Atlas.

Deliverables

CASE STUDY.docx

Recording_mongodb_cloud_settings(replica set, region).mp4

MongoDB Atlas Operations

The cloud exercise demonstrates:

Creating a MongoDB Atlas account.

Setting up a cloud database environment.

Configuring database deployment settings.

Selecting a cloud deployment region.

Configuring replica set settings.

Connecting the MongoDB database to the cloud environment.

Examining distributed database configuration.

The exercise demonstrates the transition from a locally managed database environment to a managed cloud database service.

MongoDB Video Demonstrations

The following videos provide practical evidence of the MongoDB operations carried out in the project.

Video 1 – MongoDB Booking Status

Recording: Recording_mongodb_query_booking_status.mp4

Watch the MongoDB Booking Status Demonstration

This demonstration shows the execution of the MongoDB booking status script.

The operation involves retrieving room and payment documents, creating a booking record, checking payment status, confirming the booking, and updating room inventory.

It demonstrates how the relational booking workflow was reproduced using MongoDB.

Video 2 – MongoDB Room Availability

Recording: Recording_mongodb_query_room_availability.mp4

Watch the MongoDB Room Availability Demonstration

This demonstration shows the execution of the room availability aggregation pipeline.

The operation filters available rooms, joins room type information, and displays the relevant room details and prices.

It demonstrates the use of MongoDB aggregation stages to retrieve meaningful hotel inventory information.

Video 3 – MongoDB Atlas Cloud Configuration

Recording: Recording_mongodb_cloud_settings(replica set, region).mp4

Watch the MongoDB Atlas Cloud Configuration Demonstration

This demonstration shows the configuration of MongoDB Atlas cloud settings, including replica set and region configuration.

It provides evidence of the cloud database deployment exercise and the configuration of a distributed database environment.

Challenges Encountered with MongoDB Atlas

Working with MongoDB Atlas introduced several cloud database configuration and connectivity challenges.

1. Cloud Database Connectivity

Connecting MongoDB tools to a cloud-hosted cluster requires the correct connection string and authentication details.

Incorrect connection strings or connection settings can prevent successful communication with the database.

2. Network Access Configuration

MongoDB Atlas requires appropriate network access permissions.

The IP access list must allow the connecting machine to access the cluster. Incorrect or missing IP access rules can result in connection failures.

3. Database User Authentication

Atlas database access requires a database user with appropriate credentials and permissions.

The database user must be configured correctly before authenticated access to the cluster can be established.

4. Cluster and Region Configuration

Configuring the cloud cluster requires selecting appropriate deployment settings, including cloud provider, region, and replica set configuration.

Understanding the relationship between deployment regions, availability, and distributed database configuration was an important learning experience.

5. Transition from Local to Cloud Databases

Moving from a local SQL Server or MongoDB environment to MongoDB Atlas requires adapting to a cloud-hosted database environment.

The cloud environment introduces additional considerations for connectivity, access control, deployment configuration, and database administration.

Lessons Learned

The MongoDB Atlas exercise highlighted the importance of:

Correct cloud database configuration.

Secure database authentication.

Proper network access management.

Understanding replica sets and distributed database architecture.

Reliable connection management.

Cloud database administration.

These challenges describe the main configuration and connectivity issues relevant to the Atlas exercise; the exact error messages and troubleshooting sequence should be documented from the recorded session if required.

Learning Outcomes

This advanced database portfolio demonstrates practical knowledge of:

Relational database design.

Entity Relationship modelling.

SQL table creation and data manipulation.

Primary and foreign key constraints.

SQL JOIN operations.

Room availability queries.

Payment and booking workflows.

SQL transactions and concurrency.

Isolation levels and transaction consistency.

Query execution plan analysis.

MongoDB document-based data modelling.

MongoDB CRUD operations.

MongoDB aggregation pipelines.

MongoDB $lookup operations.

Cloud database deployment.

MongoDB Atlas configuration.

Replica sets and distributed database concepts.

Technical documentation and version control using GitHub.

Repository Structure

advanced-database-portfolio/
│
├── portfolio-1-database-design/
│   ├── Parkview Astoria Hotel.docx
│   └── Screenshot_ER_Diagram_Objects.png
│
├── portfolio-2-query-optimization/
│   ├── insert_room_types.sql
│   ├── insert_rooms.sql
│   ├── insert_room_payments.sql
│   ├── select_rooms.sql
│   ├── select_room_payments.sql
│   ├── retrieve_new_users.sql
│   ├── query_room_availability.sql
│   ├── query_room_availability_checker.sql
│   ├── query_booking_status.sql
│   └── execution_plan_*.sqlplan
│
├── portfolio-3-transaction-concurrency/
│   ├── query_trans_commit_insert_objects.sql
│   └── Screenshot_query_booking_status_with_isolation_levels.png
│
├── portfolio-4-nosql/
│   ├── mongo_db_booking_status.js
│   ├── mongodb_room_availability_code.txt
│   ├── mongodb_room_availability_code_through_aggregration.json
│   ├── Screenshot_mongodb_account_created.png
│   └── Videos of room_availability and query_booking_status(Mongodb)/
│       ├── Recording_mongodb_query_booking_status.mp4
│       └── Recording_mongodb_query_room_availability.mp4
│
└── portfolio-5-distributed-cloud/
    ├── CASE STUDY.docx
    └── Recording_mongodb_cloud_settings(replica set, region).mp4

Conclusion

The Parkview Astoria Hotel Advanced Database Systems Portfolio demonstrates the practical implementation of database technologies for hotel reservation management.

The project progresses from relational database design and SQL implementation to transaction management, NoSQL operations, and cloud database deployment.

By implementing the same hotel booking operations in SQL Server and MongoDB, the portfolio illustrates the differences between relational and document-oriented databases while demonstrating how both technologies can support hotel reservation and inventory management.

The MongoDB Atlas exercise further extends the project into cloud database deployment and distributed database configuration.
