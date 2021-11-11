class UserHandler
  attr_reader :user_id, :user_name

  def initialize(user_id = '', user_name = '')
    @user_id = user_id
    @user_name = user_name
  end

  def self.get_user_id(user_name)
    result = Database.query("SELECT user_id FROM users WHERE user_name= '#{user_name}';")
    result.map { |user| UserHandler.new(user['user_id']) }
    result[0]['user_id']
  end

  def self.add_user(user_name)
    Database.query("INSERT INTO users(user_name) VALUES($1);", [user_name])
  end

  def self.get_user_name(user_id)
    result = Database.query("SELECT user_name FROM users WHERE user_id= #{user_id};")
    result.map { |user| UserHandler.new(user['user_name']) }
    result[0]['user_name']
  end
end
