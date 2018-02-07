require('pg')
require('pry')
require_relative("../db/sql_runner.rb")

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql="INSERT INTO albums (title, genre, artist_id)
      VALUES ($1,$2,$3)
      RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql="SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE albums SET title = $1, genre = $2, artist_id = $3 WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)

    return artists.map{|band| Artist.new(band)}
    

  end


end
