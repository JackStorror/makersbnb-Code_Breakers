feature 'Space naming' do
  scenario 'user can add a space name' do
    visit '/spaces/new'
    fill_in 'space_name', with: 'Bat Cave'
    click_button 'Submit'
    expect(page).to have_content 'Bat Cave'
  end
end
