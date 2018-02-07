require('pg')
require_relative("../db/sql_runner.rb")

class Artist

  attr_accessor :name, :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    sql="INSERT INTO artists (name)
      VALUES ($1)
      RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql="SELECT * FROM artists"
    artist = SqlRunner.run(sql)
    return artist.map{|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album = SqlRunner.run(sql, values)
    result = Album.new(album[0])
    return result
  end

end
