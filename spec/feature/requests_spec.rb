feature 'requesting behaviours' do 

  it 'we can see the request for our spaces' do 
    visit('/sign_up')
    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")
    click_on 'Submit'
    visit('/sign_in')
    visit('/sign_in')
    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")
    click_on 'Login'
    populate_users_table
    populate_spaces_table
    populate_requests_table
    visit '/view_requests'
    expect(page).to have_content "Booking Requests"
    expect(page).to have_content "Bat Cave"
  end 

end 