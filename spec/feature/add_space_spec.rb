
feature 'adding a space' do 
  
  scenario 'we can add a space' do 
    visit('/add_space')
    fill_in(:space_name, with: 'Bat Cave')
    click_on 'Submit'
    result = connection.exec('SELECT * FROM spaces')
    expect(result.first['name']).to eq 'Bat Cave'
  end 

end 