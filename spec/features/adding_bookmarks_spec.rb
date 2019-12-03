feature 'adding_bookmarks' do
  scenario 'it adds bookmarks' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in 'URL', with: 'Another Bookmark'
    click_button 'Add'
    expect(page).to have_content('Another Bookmark')
  end
end