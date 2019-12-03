require 'pg'

class Bookmarks

  def self.show
<<<<<<< HEAD
    con = PG.connect dbname: 'bookmark_manager' , user: ENV['USER']
    rows = con.exec "SELECT url FROM bookmarks"
    rows.map(&:values).flatten
  ensure
    con.close if con
=======
    con = PG.connect :dbname => 'bookmark_manager'

    rs = con.exec "SELECT url FROM bookmarks"

    urls = rs.to_a.map { |row| row["url"] }
>>>>>>> dc23dbfe814f300e5a07d0b4a7983bad66a4edb5
  end
end
