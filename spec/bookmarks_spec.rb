require 'bookmarks'

describe Bookmarks do

  describe "#show" do
    it "shows the list of bookmarks" do
      bookmark = Bookmarks.new
      expect(bookmark.show).to eq(["Random", "Bookmark", "My Favorite"])
    end


  end


end
