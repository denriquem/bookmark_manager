feature "Viewing bookmarks" do
  # before :each do
  #   add_row "http://www.makersacademy.com"
  #   add_row "http://www.google.com"
  #   add_row "http://www.destroyallsoftware.com"
  # end

  scenario "Displays bookmarks" do
    Bookmarks.add(url: 'http://www.makersacademy.com', title: 'Makers')
    visit '/bookmarks'
    expect(page). to have_link('Makers', href: "http://www.makersacademy.com")
  end
end
