require 'bookmarks'
require 'pg'

describe Bookmarks do
  before :each do
    add_row "url1"
    add_row "url2"
    add_row "url3"
  end

  describe ".show" do
    it "shows the list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #Add the test data
      bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmarks.add(url: "http://www.google.com", title: "Google")

      p bookmarks = Bookmarks.show

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.add' do
    it 'should add a bookmark' do
      bookmark = Bookmarks.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark['url']).to eq 'http://www.testbookmark.com'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end

end
