-- Create room types to describe the type of suite in the hotel with their prices and if their rooms are available, undergoing maintenance or occupied. This attributes would be useful in detrminining the number of rooms that are under the former statuses

INSERT INTO room_types(
    room_type_id, 
    type_name, 
    room_price, 
    total_num_rooms, 
    num_available_rooms, 
    num_rooms_occupied, 
    num_rooms_maintenance
)
VALUES 
    ('DS', 'Deluxe Suite', 100.00, 20, 20, 0, 0),
    ('LDS', 'Luxury Deluxe Suite', 150.00, 20, 20, 0, 0),
    ('ES', 'Executive Suite', 200.00, 20, 20, 0, 0),
    ('DIS', 'Diplomatic Suite', 200.00, 20, 20, 0, 0),
    ('TB', 'Twin Bed', 50.00, 20, 20, 0, 0);