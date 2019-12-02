require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Hello Sinatra"
  end

  run! if app_file == $0
end
