require_relative 'database'
require_relative './space_row'
require_relative 'user_handler'

class SpaceHandler
  attr_reader :space_id, :space_name, :space_description, :price_per_night, :user_id

  def initialize(space_id:, space_name:, space_description:, price_per_night:, user_id:)
    @space_id = space_id
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
    @user_id = user_id
  end

  def self.add_space(space_name:, space_description:, price_per_night:, user_id:)
    Database.connect('makers_bnb')
    Database.query(
      "INSERT INTO spaces(
      space_name,
      space_description,
      price_per_night,
      user_id
      ) VALUES($1, $2, $3, $4);",
      [space_name, space_description, price_per_night, user_id]
    )
  end

  def self.fetch_spaces
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM spaces;')
    result.map do |space|
      SpaceHandler.new(
        space_id: space['space_id'],
        space_name: space['space_name'],
        space_description: space['space_description'],
        price_per_night: space['price_per_night'],
        user_id: space['user_id']
      )
    end
  end

  def self.fetch_space_by_id(space_id:)
    Database.connect('makers_bnb')
    result = Database.query("SELECT * FROM spaces WHERE space_id = '#{space_id}';")
    result.map do |space|
      SpaceHandler.new(
        space_id: space['space_id'],
        space_name: space['space_name'],
        space_description: space['space_description'],
        price_per_night: space['price_per_night'],
        user_id: space['user_id']
      )
    end
  end 

  def self.fetch_space_rows
    rows = []
    result = fetch_spaces
    result.each do |space|
      user_id = space.user_id.to_i
      user_name = UserHandler.fetch_user_name(user_id)
      rows << SpaceRow.new(
        space.space_name,
        space.space_description,
        space.price_per_night,
        user_name
      )
    end
    return rows
  end

  def self.create_space(space_name:, space_description:, price_per_night:, user_name:)
    user_id = UserHandler.fetch_user_id(user_name)
    add_space(
      space_name: space_name,
      space_description: space_description,
      price_per_night: price_per_night,
      user_id: user_id
    )
  end

  def self.spaces_available(query_start:, query_end:)
    Database.connect('makers_bnb')
    result = Database.query("SELECT * FROM spaces WHERE space_id NOT IN (select space_id FROM bookings WHERE (booking_start BETWEEN '#{query_start}' AND '#{query_end}') OR (booking_end BETWEEN '#{query_start}' AND '#{query_end}') OR (booking_start <= '#{query_start}' AND booking_end >= '#{query_end}'));")
    result.map do |space|
      SpaceHandler.new(
        space_id: space['space_id'],
        space_name: space['space_name'],
        space_description: space['space_description'],
        price_per_night: space['price_per_night'],
        user_id: space['user_id']
      )
    end
  end
end
