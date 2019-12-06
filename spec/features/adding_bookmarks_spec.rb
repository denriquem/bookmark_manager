feature 'adding_bookmarks' do
  scenario 'it adds bookmarks' do
    visit '/add_form'
    # click_button 'Add Bookmark'
    fill_in 'url', with: 'www.test_url.com'
    fill_in 'title', with: 'Test Bookmark'
    click_button 'Add'
    expect(page).to have_link('Test Bookmark', href: "www.test_url.com")
  end
end
