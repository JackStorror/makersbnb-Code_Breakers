require 'PG'
def connect_to_db
  connection = PG.connect(dbname: 'makers_bnb_test')
end 