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

  def save()
    sql="INSERT INTO music_collection (name, title, genre, artist_id)
      VALUES ($1,$2,$3,$4)
      RETURNING id"
    values[@name, @title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)
  end 

end
