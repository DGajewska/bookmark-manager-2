require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Hello"
  end

  get '/bookmarks' do
    @bookmarks = BookMark.new.print
    erb :bookmarks
  end

  run! if app_file == $0

end
