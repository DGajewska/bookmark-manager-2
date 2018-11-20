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

  scenario 'use a form to add a bookmark' do
    visit '/add-bookmark'
    expect(page).to have_field "bookmark_url"
    expect(page).to have_button "Add"
  end

  scenario 'new bookmark is included in bookmark list' do
    visit '/add-bookmark'
    fill_in :bookmark_url, with: "http://codewars.com"
    click_button "Add"
    expect(page).to have_content "http://codewars.com"
  end
end
