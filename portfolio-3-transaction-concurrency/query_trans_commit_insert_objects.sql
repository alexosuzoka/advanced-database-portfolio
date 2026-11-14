-- Persist sample data in PAH-HRS database

-- Implement collectively on all tables with the exception of the bookings table(Guests, Room_types, Rooms, Room_payments) as system is designed to await prerequisites before any booking operations can be done


USE [PAH-HRS];
GO
ALTER DATABASE [PAH-HRS] SET READ_COMMITTED_SNAPSHOT ON;
ALTER DATABASE [PAH-HRS] SET ALLOW_SNAPSHOT_ISOLATION ON;
GO

Begin Transaction hrs_insert_objects;

INSERT INTO guests (first_name, last_name, email, phone_number)
VALUES 
    ('Michael', 'Chuwuemeka', 'michael_chuks@gmail.com', '+234805553789144'),
    ('Alexander', 'Morse', 'alexander.j.morse@gmail.com', '+234802890192831'),
    ('Amelie', 'Griffith', 'amelie,g,griffith@outlook.com', '+234807220147294'),
    ('Bowen', 'Higgins', 'bowen.t.higgins@gmail.com', '+234806551703820'),
    ('Camila', 'Acevedo', 'camila.m.acevedo@yahoo.com', '+234809551204958');

    INSERT INTO room_types (
    room_type_id, 
    type_name, 
    room_price, 
    total_num_rooms, 
    num_available_rooms, 
    num_rooms_occupied, 
    num_rooms_maintenance
)
VALUES 
    ('DS', 'Deluxe Suite', 100000.00, 20, 20, 0, 0),
    ('LDS', 'Luxury Deluxe Suite', 150000.00, 20, 20, 0, 0),
    ('ES', 'Executive Suite', 200000.00, 20, 20, 0, 0),
    ('DIS', 'Diplomatic Suite', 250000.00, 20, 20, 0, 0),
    ('TB', 'Twin Bed', 50000.00, 20, 20, 0, 0);


    INSERT INTO rooms (room_type_id, availability_status)
VALUES 
    ('DS', 'Available'),
    ('ES', 'Occupied'),
    ('TB', 'Available'),
    ('LDS', 'Maintenance'),
    ('DIS', 'Available'),
    ('DS', 'Occupied'),
    ('ES', 'Available'),
    ('TB', 'Occupied');


    INSERT INTO room_payments (payment_options,payment_amount, payment_status, guest_id)
VALUES 
    ('Debit Card', 200000.00, 'Paid', 'G0035'),
    ('Bank Transfer',450000.00, 'Paid', 'G0036'),
    ('Cash', 600000.00, 'Paid', 'G0037'),
    ('Bank Transfer',1000000.00, 'Pending', 'G0038'),
    ('Debit Card',200000.00, 'Pending', 'G0039');

 COMMIT TRANSACTION hrs_insert_objects;
 GO