feature 'display_spaces' do

  scenario 'should display space details' do

    connect_to_db_makers_bnb.exec("INSERT INTO spaces(space_name, space_description, price_per_night) VALUES('Bat Cave', 'Its a bat cave', 2.55);")
    visit ('/display_spaces')
    expect(page).to have_content 'Bat Cave'

  end

end
