require 'bookmarks'

describe Bookmarks do

  describe "#show" do
    it "shows the list of bookmarks" do
      expect(Bookmarks.show).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"])
    end


  end


end
