feature 'signs user up to makers bnb' do 
  
  scenario 'user inputs username and password' do 

    visit('/sign_up')
    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")
    click_on 'Submit'

    expect(connect_to_db_makers_bnb.exec("SELECT * FROM users;").first['user_name']).to eq "Batman"

  end 

end 