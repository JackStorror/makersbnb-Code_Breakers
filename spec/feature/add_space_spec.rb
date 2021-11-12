feature 'adding a space' do

  scenario 'we can add a space' do
    populate_users_table
    visit('/sign_in')

    fill_in(:user_name, with: "bruce@wayne.com")
    fill_in(:password, with: "password")

    click_on 'Login'

    visit('/add_space')

    UserHandler.create_user(user_name: 'Bobo', password: 'too too')
    fill_in(:space_name, with: 'Bat Cave')
    fill_in(:space_description, with: 'Its a bat cave')
    fill_in(:price_per_night, with: 2.55)

    click_on 'Submit'

    result = connect_to_db_makers_bnb.exec('SELECT * FROM spaces')

    expect(result.first['space_name']).to eq 'Bat Cave'
    expect(result.first['space_description']).to eq 'Its a bat cave'
    expect(result.first['price_per_night']).to eq '2.55'
    expect(UserHandler.fetch_user_name(result.first['user_id'])).to eq 'bruce@wayne.com'

  end

end
