feature 'Basic Feature Test' do
  scenario 'Hello sinatra on screen' do
    visit '/'
    expect(page). to have_content("Bookmark manager")
  end
end
