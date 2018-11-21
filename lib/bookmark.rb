require 'pg'

class BookMark

  attr_reader :list
  # attr_reader :print
  @@bookmark_manager = nil

  def self.create
    @@bookmark_manager = BookMark.new
  end

  def self.instance
    @@bookmark_manager
  end

  def initialize
      ENV['RACK_ENV'] == 'test' ? database = 'bookmark_manager_test' : database = 'bookmark_manager'
      @con = PG.connect :dbname => database
      results = @con.exec "SELECT * FROM bookmarks"

    @list = results.map {|row| {:id => row['id'],
                                :url => row['url'],
                                :title => row['title']}}

  end

  def print
    @list
  end

  def add(url,title)
    @con.exec "INSERT INTO bookmarks(url,title) VALUES('#{url}','#{title}')"
  end

  def delete(id)
   @con.exec "DELETE FROM bookmarks WHERE id='#{id}';"
  end
end
