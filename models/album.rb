require('pg')
require_relative("../db/sql_runner.rb")

class Albums

  attr_accessor :name, :title, :genre, :artist_id
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end


end
