require_relative '../model/database'
require 'database_helper'

describe Database do 
  describe '.add_space' do 

    it 'We can add a space to the database' do 
      Database.add_space(name: "Bat Cave")
      expect(connection.exec('SELECT name FROM spaces').first['name']).to eq "Bat Cave"
    end 

  end 

end 