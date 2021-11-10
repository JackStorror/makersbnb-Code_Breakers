
class Database

  def self.connect(database)
    if ENV['RACK_ENV'] = "test"
      PG.connect(dbname: "#{database}_test")
    else
      PG.connect(dbname: database)
    end
  end

end
