require_relative '../model/space_handler'
require 'database_helper'

describe Space_handler do 
  describe '.add_space' do 

    it 'We can add a space to the database' do 
      Space_handler.add_space(name: 'Bat Cave', description: 'Its a bat cave', price_per_night: 2.55)
      expect(connect_to_db.exec('SELECT spaces_name FROM spaces').first['spaces_name']).to eq "Bat Cave"
      expect(connect_to_db.exec('SELECT spaces_description FROM spaces').first['spaces_description']).to eq "Its a bat cave"
      expect(connect_to_db.exec('SELECT price_per_night FROM spaces').first['price_per_night']).to eq "2.55"
    end 

  end 

end 