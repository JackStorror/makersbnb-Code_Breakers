require_relative './database'
require 'bcrypt'

class UserHandler
  attr_reader :user_name, :user_id

  def initialize(user_name:, user_id:)
    @user_name = user_name
    @user_id = user_id
  end

  def self.create_user(user_name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    connection = Database.connect('makers_bnb')
    connection.query(("INSERT INTO users(user_name,password) VALUES($1,$2);"),[user_name, encrypted_password])
  end

  def self.get_user_name
    connection = Database.connect('makers_bnb')
    users = connection.query('SELECT * FROM users;')
    users.map { |user| UserHandler.new(user_id: user['user_id'], user_name: user['user_name']) }
    users.first['user_name']
  end

  def self.authentication(user_name:, password:)
    Database.connect('makers_bnb')
    result = Database.query("SELECT * FROM users WHERE user_name = $1",[user_name])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    UserHandler.new(user_id: result[0]['user_id'], user_name: result[0]['user_name'])
  end 
end