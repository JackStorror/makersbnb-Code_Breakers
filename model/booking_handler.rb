class Booking_handler
  attr_reader :booking_id, :space_id, :booking_start, :booking_end

  def initialize(booking_id:, space_id:, booking_start:, booking_end:)
    @booking_id = booking_id
    @space_id = space_id
    @booking_start = booking_start
    @booking_end = booking_end
  end

  def self.add_booking(space_id:, booking_start:, booking_end:)
    Database.connect('makers_bnb')
    booking = Database.query(
      "INSERT INTO bookings(space_id, booking_start, booking_end) VALUES($1, $2, $3) RETURNING booking_id, space_id, booking_start, booking_end;",
      [space_id, booking_start, booking_end],
    )
    Booking_handler.new(booking_id: booking[0]['booking_id'], space_id: booking[0]['space_id'], booking_start: booking[0]['booking_start'], booking_end: booking[0]['booking_end'])
  end

  def self.get_bookings
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM bookings;')
    result.map { |booking| Booking_handler.new(booking_id: booking['booking_id'], space_id: booking['space_id'], booking_start: booking['booking_start'], booking_end: booking['booking_end']) }
  end
end