require_relative './space'

class Database
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
    connection = Database.connect
    connection.exec_params(
      "INSERT INTO spaces(name, description, price_per_night) VALUES($1, $2, $3);",
      [name, description, price_per_night],
    )
  end

  def self.get_spaces
    connection = Database.connect
    result = connection.exec_params('SELECT * FROM spaces;')
    result.map { |space| Database.new(id: space['id'], name: space['name'], description: space['description'], price_per_night: space['price_per_night']) }
  end

end