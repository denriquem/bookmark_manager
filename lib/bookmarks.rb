require 'pg'

class Bookmarks

  def self.show
    con = PG.connect dbname: 'bookmark_manager' , user: ENV['USER']
    rows = con.exec "SELECT url FROM bookmarks"
    rows.map(&:values).flatten
  ensure
    con.close if con
  end
end
