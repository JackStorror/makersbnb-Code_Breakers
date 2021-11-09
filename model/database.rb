require_relative './space'
class Database
  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def connect
    if ENV['RACK_ENV'] = "test"
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
  end

  def self.add_space(name:)
    connect
    result = connection.exec_params('INSERT INTO spaces(name) VALUES($1)', [name])
  end

  def self.get_spaces
    result = connection.exec_params('SELECT * FROM spaces;')
    result.map { |space| Space.new(space['id'], space['name']) }
  end

end