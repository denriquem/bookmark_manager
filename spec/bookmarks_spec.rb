require 'bookmarks'
require 'pg'

describe Bookmarks do

  before(:each) {allow(PG).to receive(:connect).and_return(connection)}

  let (:connection) { double :dbcon, exec: [{'url' => 'url1'},{'url' => 'url2'}, {'url' => 'url3'}],
                                     close: nil}
 
  describe "#show" do
    it "shows the list of bookmarks" do
<<<<<<< HEAD
      expect(Bookmarks.show).to eq(["url1", "url2", "url3"])
=======
      expect(Bookmarks.show).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"])
>>>>>>> dc23dbfe814f300e5a07d0b4a7983bad66a4edb5
    end

    it "should try to connect to the corect database" do
      expect(PG).to receive(:connect).with({dbname: 'bookmark_manager', user: ENV['USER']})
      Bookmarks.show
    end

    it 'should query the database correctly' do
      expect(connection).to receive(:exec).with 'SELECT url FROM bookmarks'
      Bookmarks.show
    end

  end

end
