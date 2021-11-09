class Space_handler
  attr_reader :id, :name, :description, :price_per_night

  def initialize(id:, name:, description:, price_per_night:)
    @id = id
    @name = name
    @description = description
    @price_per_night = price_per_night
  end

  def self.connect
    if ENV['RACK_ENV'] = "test"
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
  end

  def self.add_space(name:, description:, price_per_night:)
    connection = Space_handler.connect
    connection.exec_params(
      "INSERT INTO spaces(spaces_name, spaces_description, price_per_night) VALUES($1, $2, $3);",
      [name, description, price_per_night],
    )
  end

  def self.get_spaces
    connection = Space_handler.connect
    result = connection.exec_params('SELECT * FROM spaces;')
    result.map { |space| Space_handler.new(id: space['spaces_id'], name: space['spaces_name'], description: space['spaces_description'], price_per_night: space['price_per_night']) }
  end

end