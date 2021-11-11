feature 'We can sign in with existing user' do 

  scenario 'sign in page is available' do 

    visit '/sign_in'
    expect(page).to have_content "Sign In"

  end 

  scenario 'we can sign in with an existing user' do 
    visit('/sign_up')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")

    click_on 'Submit'

    visit('/sign_in')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")

    click_on 'Login'
    expect(page).to have_content 'Welcome Batman'
  end 

  scenario 'we cant sign in with invalid details' do 
    visit('/sign_up')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")

    click_on 'Submit'

    visit('/sign_in')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gothaaaa")

    click_on 'Login'
    expect(page).to have_content 'Invalid Login Attempt'
  end

  scenario 'once signed in we can sign out' do 

    visit('/sign_up')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")

    click_on 'Submit'

    visit('/sign_in')

    fill_in(:user_name, with: "Batman")
    fill_in(:password, with: "Gotham")

    click_on 'Login'

    click_on 'Sign out'

    expect(page).not_to have_content "Batman"
    expect(page).to have_content "You have signed out."


  end 
end 