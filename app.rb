require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Hello Sinatra"
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.show
    erb :bookmarks
  end

  run! if app_file == $0
end
