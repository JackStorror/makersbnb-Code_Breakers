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
    sid = space_id 
    bs = booking_start 
    be = booking_end

    not_available = BookingHandler.available?(sid, bs, be)
    raise 'Sorry the space is not available on those dates' if not_available == true

    booking = Database.query(
      "INSERT INTO bookings(space_id, booking_start, booking_end, user_id, host_id) VALUES($1, $2, $3, $4, $5) RETURNING booking_id, space_id, booking_start, booking_end, user_id, host_id;",
      [space_id, booking_start, booking_end, user_id, host_id],
    )
    BookingHandler.new(booking_id: booking[0]['booking_id'], space_id: booking[0]['space_id'], 
booking_start: booking[0]['booking_start'], booking_end: booking[0]['booking_end'], user_id: booking[0]['user_id'], host_id: booking[0]['host_id'])
  end

  def self.get_bookings
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM bookings;')
    result.map do |booking|
      BookingHandler.new(booking_id: booking['booking_id'], space_id: booking['space_id'], 
     booking_start: booking['booking_start'], booking_end: booking['booking_end'], user_id: booking['user_id'], host_id: booking['host_id'])
    end    
  end

  def self.available?(sid, bs, be)
    Database.connect('makers_bnb')
    @array = []
    result = Database.query("SELECT * FROM bookings WHERE space_id = '#{sid}' AND ((booking_start BETWEEN '#{bs}' AND '#{be}') OR (booking_end BETWEEN '#{bs}' AND '#{be}') OR (booking_start <= '#{bs}' AND booking_end >= '#{be}'));")
    result.map { |available| @array.push(available) }
    return true if @array.length >= 1
    false
  end
end
