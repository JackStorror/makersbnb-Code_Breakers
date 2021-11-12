require_relative '../../model/user_handler'
feature 'display_spaces' do

  scenario 'should display space details' do
    UserHandler.create_user(user_name: 'John Scott', password: 'loco')
    user_id = UserHandler.fetch_user_id('John Scott').to_i
    connect_to_db_makers_bnb.exec(
      "INSERT INTO spaces(space_name, space_description, price_per_night, user_id)
      VALUES('Bat Cave', 'Its a bat cave', 2.55, #{user_id});"
    )
    visit ('/display_spaces')

    expect(page).to have_content 'Bat Cave'
    expect(page).to have_content 'Its a bat cave'
    expect(page).to have_content 2.55
    expect(page).to have_content 'John Scott'
  end
end
