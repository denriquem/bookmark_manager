require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Hello Sinatra"
  end

  get '/bookmarks' do
    bookmark1 = Bookmarks.new
    @bookmarks = bookmark1.show
    # "Random Bookmark My Favorite"
    erb :bookmarks
  end

  run! if app_file == $0
end
