-- Confirm the payment status after payment made to the rooms, then proceed to add to the bookings table



-- Declare the required avariables for use

ALTER DATABASE [PAH-HRS] SET READ_COMMITTED_SNAPSHOT ON;
ALTER DATABASE [PAH-HRS] SET ALLOW_SNAPSHOT_ISOLATION ON;
GO


USE [PAH-HRS];
GO

BEGIN TRANSACTION bk_update_booking_status;
GO

DECLARE @pay_trans_id VARCHAR(30)
DECLARE @pay_status VARCHAR(10)
DECLARE @amount DECIMAL(10,2)
DECLARE @id_room VARCHAR(7) = 'Room113'
DECLARE @room_type VARCHAR(3)
DECLARE @chk_in_date DATE = '2026-11-10'
DECLARE @chk_out_date DATE = '2026-11-12'
DECLARE @g_id VARCHAR(5) = 'G0035'
DECLARE @update_count INT = 1

SELECT @room_type = room_type_id FROM rooms  WHERE room_id = @id_room


SELECT 
    @pay_trans_id = payment_trans_id,  
    @pay_status = payment_status, 
    @amount = payment_amount
FROM room_payments
WHERE guest_id = @g_id;


-- Book the room but the booking status will be pending
BEGIN
INSERT INTO bookings (
 guest_id,
 room_id,
 check_in_date,
 check_out_date,
 total_amount,
 payment_trans_id,
 booking_status

)

VALUES (@g_id, @id_room, @chk_in_date, @chk_out_date, @amount, @pay_trans_id, 'Pending');
END

IF @pay_status = 'Paid'
 -- Updating the Bookings to reflect the changes

 UPDATE bookings
 SET booking_status = 'Confirmed'
 WHERE guest_id = @g_id and room_id = @id_room

-- Once booking has been done to that room, we need to update the number of available rooms

UPDATE room_types
SET num_available_rooms = num_available_rooms - @update_count,
num_rooms_occupied = num_rooms_occupied + 1
WHERE room_type_id = @room_type

COMMIT TRANSACTION bk_update_booking_status;
GO



