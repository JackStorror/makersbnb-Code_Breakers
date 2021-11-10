class Space_handler
  attr_reader :space_id, :space_name, :space_description, :price_per_night

  def initialize(space_id:, space_name:, space_description:, price_per_night:)
    @space_id = space_id
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
  end

  def self.connect
    if ENV['RACK_ENV'] = "test"
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
  end

  def self.add_space(space_name:, space_description:, price_per_night:)
    connection = Space_handler.connect
    connection.exec_params(
      "INSERT INTO spaces(space_name, space_description, price_per_night) VALUES($1, $2, $3);",
      [space_name, space_description, price_per_night],
    )
  end

  def self.get_spaces
    connection = Space_handler.connect
    result = connection.exec_params('SELECT * FROM spaces;')
    result.map { |space| Space_handler.new(space_id: space['space_id'], space_name: space['space_name'], space_description: space['space_description'], price_per_night: space['price_per_night']) }
  end

end