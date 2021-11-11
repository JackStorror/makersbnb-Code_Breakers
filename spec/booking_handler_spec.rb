require_relative '../model/booking_handler'
require_relative '../model/space_handler'

describe BookingHandler do
  describe '.add_booking' do
    it 'add_bookings a add booking in the database' do
      populate_spaces_table
      #      persist_space_id(table: 'spaces')
#      p @space_id[0]['space_id']
      booking = BookingHandler.add_booking(space_id: 1, booking_start: "01-03-2022", booking_end: "04-03-2022")
      persisted_data = persisted_booking_id(booking_id: booking.booking_id, table: 'bookings')

      expect(booking).to be_a BookingHandler
      expect(booking.space_id).to eq persisted_data.first['space_id']
      expect(booking.booking_start).to eq "2022-01-03"
      expect(booking.booking_end).to eq "2022-04-03"
    end

    it 'refuses bookings with conflicting dates' do

    end
  end


  describe '.all_bookings' do
    it 'returns all current bookings' do
      populate_spaces_table
      booking = BookingHandler.add_booking(space_id: 1, booking_start: '01-04-2022', booking_end: '05-04-2022')
      BookingHandler.add_booking(space_id: 2, booking_start: '02-04-2022', booking_end: '05-04-2022')
      BookingHandler.add_booking(space_id: 3, booking_start: '06-04-2022', booking_end: '07-04-2022')
    
      bookings = BookingHandler.get_bookings
    
      expect(bookings.length).to eq 3
      expect(bookings.first).to be_a BookingHandler
      expect(bookings.first.space_id).to eq booking.space_id
    end
  end

  describe '.available' do
 #   it 'confirms whether the property is available' do

 #     expect(booking.available).to eq (space_id: 8)
  end
end
