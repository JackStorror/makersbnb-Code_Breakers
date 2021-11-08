require 'PG'
def connection
  connection = PG.connect(dbname: 'makers_bnb_test')
end 