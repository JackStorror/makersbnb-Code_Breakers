require_relative '../model/space_handler'
require 'database_helper'

describe SpaceHandler do 

  describe '.add_space' do 

    it 'We can add a space to the database' do 
      SpaceHandler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55)
      expect(connect_to_db_makers_bnb.exec('SELECT space_name FROM spaces').first['space_name']).to eq "Bat Cave"
      expect(connect_to_db_makers_bnb.exec('SELECT space_description FROM spaces').first['space_description']).to eq "Its a bat cave"
      expect(connect_to_db_makers_bnb.exec('SELECT price_per_night FROM spaces').first['price_per_night']).to eq "2.55"
    end 

  end 

  describe '.get_spaces' do 

    it 'checks we can get space' do 
      connect_to_db_makers_bnb.exec("INSERT INTO spaces(space_name, space_description, price_per_night) VALUES('Bat Cave', 'Its a bat cave', 2.55);")
      expect(SpaceHandler.get_spaces.first.space_name).to eq "Bat Cave"
    end 

  end 

  describe '.get_available_spaces' do

    it 'returns only spaces which are available' do
      
    end

end
