feature "Viewing bookmarks" do
  scenario "Displays bookmarks" do
    visit '/bookmarks'
    expect(page). to have_content("Random")
    expect(page). to have_content("Bookmark")
    expect(page). to have_content("My Favorite")
  end
end
