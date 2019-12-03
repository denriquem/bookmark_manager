require 'bookmarks'
require 'pg'

describe Bookmarks do
  before :each do
    add_row "url1"
    add_row "url2"
    add_row "url3"
  end

  describe "#show" do
    it "shows the list of bookmarks" do
      expect(Bookmarks.show).to eq(["url1", "url2", "url3"])
    end

    it "should try to connect to the corect database" do
      expect(PG).to receive(:connect).with({dbname: 'bookmark_manager_test', user: ENV['USER']}).and_call_original
      Bookmarks.show
    end

  end

  describe '.add' do
    it 'should add a bookmark' do
      Bookmarks.add('https//:foobar.com')
      expect(Bookmarks.show).to include('https//:foobar.com')
    end
  end

end
