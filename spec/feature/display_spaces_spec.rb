require_relative '../../model/display_spaces'

feature 'display_spaces' do
  scenario 'should display space details' do
    visit ('/display_spaces')
    expect(page).to have_content 'Bat Cave'
  end
end
