class Database
  attr_reader :id, :name 
  def initialize(id:,name:)
    @id = id 
    @name = name
  end 

  def self.connect
    if ENV['RACK_ENV'] = "test"
      connection = PG.connect(dbname: 'makers_bnb_test')
    else 
      connection = PG.connect(dbname: 'makers_bnb')
    end 
  end

  def self.add_space(name:)
    connection = Database.connect
    result = connection.exec_params('INSERT INTO spaces(name) VALUES($1)', [name])
  end 

end