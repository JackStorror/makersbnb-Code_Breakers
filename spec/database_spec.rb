require_relative '../model/database'

describe Database do 
  
  describe '.connect' do 

    it 'checks we can connect to database' do 

      expect(Database.connect('makers_bnb')).to be_instance_of(PG::Connection)

    end

  end 


end 