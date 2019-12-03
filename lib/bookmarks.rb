require 'pg'

class Bookmarks

  def self.show
    dbname = ENV['RACK_ENV'] == "test" ? 'bookmark_manager_test' : 'bookmark_manager'
    con = PG.connect dbname: dbname , user: ENV['USER']
    rows = con.exec "SELECT url FROM bookmarks"
    rows.map(&:values).flatten
  ensure
    con.close if con
  end
end
