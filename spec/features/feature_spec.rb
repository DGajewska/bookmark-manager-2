require 'spec_helper'


feature 'A list of bookmarks exists' do
  before do
    reset_test_database
  end

  scenario 'By visiting /bookmarks user can access the list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_link("Makers Academy", href: 'http://www.makersacademy.com')
    expect(page).to have_link("Destroy", href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link("Google", href: 'http://www.google.com')
    end

  scenario 'use a form to add a bookmark' do
    visit '/add-bookmark'
    expect(page).to have_field "title"
    expect(page).to have_field "bookmark_url"
    expect(page).to have_button "Add"
  end

  scenario 'new bookmark is included in bookmark list' do
    visit '/add-bookmark'
    fill_in :title, with: "Codewars"
    fill_in :bookmark_url, with: "http://codewars.com"
    click_button "Add"
    expect(page).to have_link('Codewars', href: 'http://codewars.com')
  end
end
