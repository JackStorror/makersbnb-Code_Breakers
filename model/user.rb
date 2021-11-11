require_relative './database'

class User
  attr_reader :user_name, :user_id

  def initialize(user_name:, user_id:)
    @user_name = user_name
    @user_id = user_id
  end

  def self.create_user(username)
    connection = Database.connect('makers_bnb')
    connection.exec("INSERT INTO users(user_name) VALUES('#{username}');")
  end

  def self.get_user_name
    connection = Database.connect('makers_bnb')
    users = connection.exec_params('SELECT * FROM users;')
    users.map { |user| User.new(user_id: user['user_id'], user_name: user['user_name']) }
    users[0]['user_name']
end
end