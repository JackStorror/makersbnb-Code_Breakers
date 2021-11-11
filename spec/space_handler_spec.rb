require_relative '../model/space_handler'
require 'database_helper'

describe SpaceHandler do 

  describe '.add_space' do 

    it 'We can add a space to the database' do 
      populate_users_table
      SpaceHandler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55, user_id: 1)
      expect(connect_to_db_makers_bnb.exec('SELECT space_name FROM spaces').first['space_name']).to eq "Bat Cave"
      expect(connect_to_db_makers_bnb.exec('SELECT space_description FROM spaces').first['space_description']).to eq "Its a bat cave"
      expect(connect_to_db_makers_bnb.exec('SELECT price_per_night FROM spaces').first['price_per_night']).to eq "2.55"
    end 

  end 

  describe '.get_spaces' do 

    it 'checks we can get space' do
      populate_users_table 
      connect_to_db_makers_bnb.exec("INSERT INTO spaces(space_name, space_description, price_per_night, user_id) VALUES('Bat Cave', 'Its a bat cave', 2.55, 1);")
      expect(SpaceHandler.get_spaces.first.space_name).to eq "Bat Cave"
    end 

  end

  describe '.get_available_spaces' do

    it 'returns only available spaces' do
      populate_users_table
      populate_spaces_table
      populate_bookings_table
      avail = SpaceHandler.spaces_available(query_start: '2022-01-04', query_end: '2022-01-05')
      expect(avail[0]).to eq "space_id" => "3", "space_name" => "Paradise", "space_description" => "Its paradise", "price_per_night" => "99", "user_id" => "3"
    end
  end

end
