class BookingHandler
  attr_reader :booking_id, :space_id, :booking_start, :booking_end, :user_id, :host_id

  def initialize(booking_id:, space_id:, booking_start:, booking_end:, user_id:, host_id:)
    @booking_id = booking_id
    @space_id = space_id
    @booking_start = booking_start
    @booking_end = booking_end
    @user_id = user_id
    @host_id = host_id
  end

  def self.add_booking(space_id:, booking_start:, booking_end:, user_id:, host_id:)
    Database.connect('makers_bnb')

    booking = Database.query(
      "INSERT INTO bookings(space_id, booking_start, booking_end, user_id, host_id) VALUES($1, $2, $3, $4, $5) RETURNING booking_id, space_id, booking_start, booking_end, user_id, host_id;",
      [space_id, booking_start, booking_end, user_id, host_id],
    )
    BookingHandler.new(booking_id: booking[0]['booking_id'], space_id: booking[0]['space_id'], booking_start: booking[0]['booking_start'], booking_end: booking[0]['booking_end'], user_id: booking[0]['user_id'], host_id: booking[0]['host_id'])
  end

  def self.get_bookings
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM bookings;')
    result.map { |booking| BookingHandler.new(booking_id: booking['booking_id'], space_id: booking['space_id'], booking_start: booking['booking_start'], booking_end: booking['booking_end'], user_id: booking['user_id'], host_id: booking['host_id']) }
  end

  def self.booking_request()

  end
end