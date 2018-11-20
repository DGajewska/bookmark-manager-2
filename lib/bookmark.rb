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

    @list = results.map {|row| row['url']}

  end

  def print
    @list.join(", ")
  end

  def add(url)
    @con.exec "INSERT INTO bookmarks(url) VALUES('#{url}')"
  end

end
