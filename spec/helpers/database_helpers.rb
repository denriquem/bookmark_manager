def truncator
  dbname = 'bookmark_manager_test'
  con = PG.connect dbname: dbname, user: ENV['USER']
  con.exec "TRUNCATE TABLE bookmarks"
ensure
  con.close if con
end

def add_row(url)
  dbname = 'bookmark_manager_test'
  con = PG.connect dbname: dbname, user: ENV['USER']
  con.exec "INSERT INTO bookmarks(url) VALUES('#{url}')"
ensure
  con.close if con
end
