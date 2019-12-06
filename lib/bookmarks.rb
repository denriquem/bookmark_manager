require 'pg'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.show
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
     result = connection.exec "INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}') RETURNING id, url, title"
     Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.connect
    dbname = ENV['RACK_ENV'] == "test" ? 'bookmark_manager_test' : 'bookmark_manager'
    PG.connect dbname: dbname , user: ENV['USER']
  end

end
