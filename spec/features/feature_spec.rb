require 'spec_helper'


feature 'A list of bookmarks exists' do
  before do
    reset_test_database
  end
  
  scenario 'By visiting /bookmarks user can access the list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
    end
end
