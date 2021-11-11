require_relative '../model/booking_handler'
require_relative '../model/space_handler'

describe BookingHandler do
  describe '.add_booking' do
    it 'add_bookings a add booking in the database' do
      populate_users_table
      populate_spaces_table
      booking = BookingHandler.add_booking(space_id: 1, booking_start: "01-03-2022", booking_end: "04-03-2022", user_id: '2', host_id: '1')
      persisted_data = persisted_booking_id(booking_id: booking.booking_id, table: 'bookings')

      expect(booking).to be_a BookingHandler
      expect(booking.space_id).to eq persisted_data.first['space_id']
      expect(booking.booking_start).to eq "2022-01-03"
      expect(booking.booking_end).to eq "2022-04-03"
    end

    it 'refuses bookings with conflicting dates' do
      populate_users_table
      populate_spaces_table
      populate_bookings_table

      expect { BookingHandler.add_booking(space_id: 1, booking_start: '2022-01-04', booking_end: '2022-01-05', user_id: 2, host_id: 1) }.to raise_exception  'Sorry the space is not available on those dates'
    end
  end


  describe '.get_bookings' do
    it 'returns all current bookings' do
      populate_users_table
      populate_spaces_table
      booking = BookingHandler.add_booking(space_id: 1, booking_start: '01-04-2022', booking_end: '05-04-2022', user_id: '2', host_id: '1')
      BookingHandler.add_booking(space_id: 2, booking_start: '02-04-2022', booking_end: '05-04-2022', user_id: '3', host_id: '2')
      BookingHandler.add_booking(space_id: 3, booking_start: '06-04-2022', booking_end: '07-04-2022', user_id: '1', host_id: '3')
    
      bookings = BookingHandler.get_bookings
    
      expect(bookings.length).to eq 3
      expect(bookings.first).to be_a BookingHandler
      expect(bookings.first.space_id).to eq booking.space_id
    end
  end

  describe '.available?' do
    it 'confirms whether the property is available' do
      populate_users_table
      populate_spaces_table
      populate_bookings_table
      expect(BookingHandler.available?(1, '2022-01-04', '2022-01-05')).to eq true
    end
  end
end
