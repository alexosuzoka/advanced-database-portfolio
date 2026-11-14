-- Reserve Room(a) - To reserve the rooms, the first task for the hotel receptionist is to list all availabile rooms
-- Test data has already been inputted on the tables in the analysis

    SELECT 
        r.room_number,
        rt.type_name,
        rt.room_price,
        r.availability_status
    FROM 
        dbo.rooms r
    INNER JOIN 
        dbo.room_types rt ON r.room_type_id = rt.room_type_id
    WHERE 
        r.availability_status = 'Available'
