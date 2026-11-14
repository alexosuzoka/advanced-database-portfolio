-- To check available rooms in the hotels

USE [PAH-HRS];
GO

SELECT r.room_id, r.availability_status, rt.type_name, rt.num_available_rooms, rt.room_price
FROM rooms r RIGHT JOIN room_types rt
ON r.room_type_id = rt.room_type_id
WHERE r.availability_status = 'Available'

GO