require 'pg'

class BookMark

  attr_reader :list
  attr_reader :print

  def initialize
      ENV['RACK_ENV'] == 'test' ? database = 'bookmark_manager_test' : database = 'bookmark_manager'
      con = PG.connect :dbname => database
      results = con.exec "SELECT * FROM bookmarks"

    @list = results.map {|row| row['url']}

  end

  def print
    @list.join(", ")
  end
end
