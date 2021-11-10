require_relative 'database'
class Space_handler
  attr_reader :space_id, :space_name, :space_description, :price_per_night

  def initialize(space_id:, space_name:, space_description:, price_per_night:)
    @space_id = space_id
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
  end

  def self.add_space(space_name:, space_description:, price_per_night:)
    Database.connect('makers_bnb')
    Database.query(
      "INSERT INTO spaces(space_name, space_description, price_per_night) VALUES($1, $2, $3);",
      [space_name, space_description, price_per_night],
    )
  end

  def self.get_spaces
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM spaces;')
    result.map { |space| Space_handler.new(space_id: space['space_id'], space_name: space['space_name'], space_description: space['space_description'], price_per_night: space['price_per_night']) }
  end

end