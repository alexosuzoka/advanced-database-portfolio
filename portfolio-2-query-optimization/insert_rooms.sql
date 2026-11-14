-- Test samples of 8 rooms with their room types and availability status

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