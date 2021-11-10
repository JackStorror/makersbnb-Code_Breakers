
class Database

  def self.connect(database)
    if ENV['RACK_ENV'] = "test"
      @connection = PG.connect(dbname: "#{database}_test")
    else
      @connection = PG.connect(dbname: database)
    end
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end 

end
