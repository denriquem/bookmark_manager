feature "Viewing bookmarks" do
  before :each do
    add_row "http://www.makersacademy.com"
    add_row "http://www.google.com"
    add_row "http://www.destroyallsoftware.com"
  end

  scenario "Displays bookmarks" do
    visit '/bookmarks'
    expect(page). to have_content("http://www.makersacademy.com")
    expect(page). to have_content("http://www.google.com")
    expect(page). to have_content("http://www.destroyallsoftware.com")
  end
end
