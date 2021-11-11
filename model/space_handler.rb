require_relative 'database'

<<<<<<< HEAD
class SpaceHandler
  attr_reader :space_id, :space_name, :space_description, :price_per_night
=======
class Space_handler
  attr_reader :space_id, :space_name, :space_description, :price_per_night, :user_id, :user_name
>>>>>>> WIP into this

  def initialize(user_name = '', space_id:, space_name:, space_description:, price_per_night:, user_id:)
    @user_name = user_name
    @space_id = space_id
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
    @user_id = user_id
  end

  def self.add_space(space_name:, space_description:, price_per_night:)
    Database.connect('makers_bnb')
    Database.query(
      "INSERT INTO spaces(space_name, space_description, price_per_night) VALUES($1, $2, $3);",
      [space_name, space_description, price_per_night],
    )
  end

  def self.get_spaces
    Database.connect('makers_bnb')
    result = Database.query('SELECT * FROM spaces;')
    result.map do |space|
     Space_handler.new(
       space_id: space['space_id'],
       space_name: space['space_name'],
       space_description: space['space_description'],
       price_per_night: space['price_per_night'],
       user_id: space['user_id']
     )
   end
  end

  def self.get_spaces_row
    p result = get_spaces
    result.each do |space|
      # p '---------'
      user_name = space['user_id']
      @user_name = UserHandler.get_user_name(user_name)
    end
  end
end
