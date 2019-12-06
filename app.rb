require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index, layout: :layout
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.show
    erb :bookmarks, layout: :layout
  end

  get '/add_form' do
    erb :add_form, layout: :layout
  end

  post '/add_form' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/add' do
    Bookmarks.add params['URL']
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
