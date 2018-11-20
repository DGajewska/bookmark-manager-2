def reset_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "TRUNCATE TABLE bookmarks"

  con.exec "INSERT INTO bookmarks(url, title)
  VALUES('http://www.makersacademy.com', 'Makers Academy'),
  ('http://www.destroyallsoftware.com', 'Destroy'),
  ('http://www.google.com', 'Google');"
end
