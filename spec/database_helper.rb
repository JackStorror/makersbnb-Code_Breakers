require 'PG'

def reset_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE spaces;')
  connection.exec('TRUNCATE users;')
end 

def connect_to_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
end 