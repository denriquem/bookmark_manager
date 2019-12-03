require 'pg'

class Bookmarks

  def self.show
    con = connect
    rows = con.exec "SELECT url FROM bookmarks"
    rows.map(&:values).flatten
  ensure
    con.close if con
  end

  def self.add(url)
    con = connect
    con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}') "
  ensure
    con.close if con
  end

  private

  def self.connect
    dbname = ENV['RACK_ENV'] == "test" ? 'bookmark_manager_test' : 'bookmark_manager'
    PG.connect dbname: dbname , user: ENV['USER']
  end

end
