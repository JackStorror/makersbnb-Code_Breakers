require_relative '../model/booking_handler'
require_relative '../model/space_handler'

describe Booking_handler do
  describe '.add_booking' do
    it 'add_bookings a new booking in the database' do
      Space_handler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55)
      persist_space_id(table: 'spaces')
      p @space_id[0]['space_id']
      booking = Booking_handler.add_booking(space_id: "#{@space_id[0]['space_id']}", booking_start: "01-03-2022", booking_end: "04-03-2022")
      persisted_data = persisted_data(id: booking.booking_id, table: 'bookings')

      expect(booking).to be_a Booking
      expect(booking.space_id).to eq persisted_data.first['space_id']
      expect(booking.booking_start).to eq "2022-01-03"
      expect(booking.booking_end).to eq "2022-04-03"
    end
  end

  describe '.all_bookings' do
    it 'returns all current bookings' do
      booking = Booking.new_booking(space_id: 1, booking_start: '01-04-2022', booking_end: '05-04-2022' )
      Booking.new_booking(space_id: 2, booking_start: '02-04-2022', booking_end: '05-04-2022')
      Booking.new_booking(space_id: 3, booking_start: '06-04-2022', booking_end: '07-04-2022')
    
      bookings = Booking.all_bookings
    
      expect(bookings.length).to eq 3
      expect(bookings.first).to be_a Booking
      expect(bookings.first.space_id).to eq booking.space_id
    end
  end

  describe '.available' do
 #   it 'confirms whether the property is available' do

 #     expect(booking.available).to eq (space_id: 8)
  end
end