require 'bookmarks'

describe Bookmarks do

  describe "#show" do
    it "shows the list of bookmarks" do
      expect(Bookmarks.show).to eq(["Random", "Bookmark", "My Favorite"])
    end


  end


end
