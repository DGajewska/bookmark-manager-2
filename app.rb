require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  before do
    @bookmark_manager = BookMark.instance
  end

  get '/' do
    "Hello"
  end

  get '/bookmarks' do
    @bookmark_manager = BookMark.create
    @bookmarks = @bookmark_manager.print
    erb :bookmarks
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/add-bookmark-submit' do
    @bookmark_manager.add(params[:bookmark_url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete-bookmark' do
    @bookmark_manager.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
