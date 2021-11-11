require_relative '../../model/user_handler'
feature 'display_spaces' do

  scenario 'should display space details' do
    user_name = 'John Scott'
    UserHandler.add_user(user_name)
    user_id = UserHandler.get_user_id(user_name)
    connect_to_db_makers_bnb.exec("INSERT INTO spaces(space_name, space_description, price_per_night, user_id)
VALUES('Bat Cave', 'Its a bat cave', 2.55, #{user_id});")
    visit ('/display_spaces')

    expect(page).to have_content 'Bat Cave'
    expect(page).to have_content 'Its a bat cave'
    expect(page).to have_content 2.55
    expect(page).to have_content 'John Scott'
  end

  scenario 'should display username' do
    user_name = 'John Scott'
    UserHandler.add_user(user_name)
    visit('/display_spaces')

    expect(page).to have_content 'John Scott'
  end

end
