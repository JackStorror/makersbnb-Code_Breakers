class Listing
  attr_reader :space_name, :space_description, :price_per_night, :user_name

  def initialize(space_name, space_description, price_per_night, user_name)
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
    @user_name = user_name
  end

end