/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

use('PAH-HRS');


// Establish session to each collection in the database and map to individual variables

const roomscollection = db.getCollection('rooms');
const bookingscollection = db.getCollection('bookings');
const roomtypesscollection = db.getCollection('room_types');  
const roompaymentscollection = db.getCollection('room_payments');


// Declare variables to be passed as query parameters to the collections in the database

let guest_id = 'G0035'
let room_id = 'Room113'
let chk_in_date = new Date('2024-11-10')
let chk_out_date = new Date('2024-11-12')  // 2 day booking
let update_count = 1  // Trigger the changes to be appliedto the available and occupied rooms when payment and booking status is verified


// Query the rooms collection to retrieve the room_type assigned to Room113
const room_instance = roomscollection.findOne({ room_id: room_id });

// Query the roompayment collection to know if the guest payment is being processed
// The below query will return the paymment instance with the guest with its id = 'G0035'
const guest_payment_instance = roompaymentscollection.findOne({guest_id: guest_id})

if (!guest_payment_instance) {
  console.log(`No payment instance found for guest with id ${guest_id}. Cannot proceed with booking.`);
}

else {
  //Create a new booking instance for the guest with the payment instance found
  const new_booking = {
    guest_id: guest_id,
    room_id: room_id,
    check_in_date: chk_in_date,
    check_out_date: chk_out_date,
    total_amount: guest_payment_instance.payment_amount,
    payment_trans_id:guest_payment_instance.payment_trans_id , // Assuming the payment instance has an amount field
    booking_status: 'Pending'  // Assuming payment is still being processed
  }
  bookingscollection.insertOne(new_booking);
  console.log(`Booking created for guest with id ${guest_id}.`);
}

if (guest_payment_instance.payment_status === 'Paid') {

  // Update the booking status in Bookings collection  to reflect the changes
  bookingscollection.updateOne(
    { guest_id: guest_id, room_id: room_id },
    { $set: { booking_status: 'Confirmed' } }
  );

  // Also update the room_types collection room availability count to reflect the changes
  roomtypesscollection.updateOne(
    { room_id: room_instance.room_type_id },
    { $inc: { num_rooms_occupied: update_count, num_available_rooms: -update_count } },

  );

  console.log(`Booking confirmed for guest with id ${guest_id}. Room availability updated.`);

}