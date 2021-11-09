require_relative '../../model/display_spaces'

feature 'display_spaces' do
  scenario 'should display space details' do
    connect_to_db.exec("INSERT INTO spaces(name, description, price_per_night) VALUES('Bat Cave', 'Its a bat cave', 2.55);")
    visit ('/display_spaces')
    expect(page).to have_content 'Bat Cave'
  end
end
