def truncator
  dbname = 'bookmark_manager_test'
  con = PG.connect dbname: dbname, user: ENV['USER']
  con.exec "TRUNCATE bookmarks"
  con.exec 'SELECT * FROM bookmarks'
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

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manger_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
