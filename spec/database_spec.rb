require_relative '../model/database'

describe Database do 
  
  describe '.connect' do 

    it 'checks we can connect to database' do 
      expect(Database.connect('makers_bnb')).to be_instance_of(PG::Connection)
    end

  end 

  describe '.query' do 

    it 'checks we can retrieve items from the database' do 
      Database.connect('makers_bnb')
      Database.query("INSERT INTO spaces(space_name, space_description, price_per_night) VALUES('Bat Cave', 'Its a bat cave', 2.55);")
      expect(Database.query('SELECT space_name FROM spaces').first['space_name']).to eq "Bat Cave"
    end 

  end 

end
