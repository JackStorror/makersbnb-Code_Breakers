require 'PG'
require_relative '../model/database'

def reset_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE spaces RESTART IDENTITY CASCADE;')
  connection.exec('TRUNCATE users RESTART IDENTITY CASCADE;')
end

def connect_to_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
end

def persisted_booking_id(booking_id:, table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.query("SELECT * FROM #{table} WHERE booking_id = '#{booking_id}';")
end

def persist_space_id(table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  @space_id = connection.query("SELECT space_id FROM #{table} ")
end

def persist_request_id(request_id:, table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.query("SELECT * FROM #{table} WHERE request_id = '#{request_id}';")
end

def populate_users_table
  UserHandler.create_user(user_name: 'bruce@wayne.com', password: 'password')
  UserHandler.create_user(user_name: 'karl@pilkington.com', password: 'password')
  UserHandler.create_user(user_name: 'michael@caine.com', password: 'password')  
end

def populate_spaces_table
  SpaceHandler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55, user_id: 1)
  SpaceHandler.add_space(space_name: 'Makers HQ', space_description: 'Makers HQ', price_per_night: 50, user_id: 2)
  SpaceHandler.add_space(space_name: 'Paradise', space_description: 'Its paradise', price_per_night: 99, user_id: 3)
end

def populate_bookings_table
  BookingHandler.add_booking(space_id: 1, booking_start: '2022-01-04', booking_end: '2022-01-05', user_id: 2, host_id: 1)
  BookingHandler.add_booking(space_id: 2, booking_start: '2022-01-02', booking_end: '2022-01-05', user_id: 3, host_id: 2)
  BookingHandler.add_booking(space_id: 3, booking_start: '2022-01-06', booking_end: '2022-01-09', user_id: 1, host_id: 3)
end

def populate_requests_table
  RequestHandler.request_booking(space_id: 1, request_start: '2022-01-04', request_end: '2022-01-05', user_id: 2, host_id: 1)
  RequestHandler.request_booking(space_id: 2, request_start: '2022-01-02', request_end: '2022-01-05', user_id: 3, host_id: 2)
  RequestHandler.request_booking(space_id: 3, request_start: '2022-01-06', request_end: '2022-01-09', user_id: 1, host_id: 3)
end
