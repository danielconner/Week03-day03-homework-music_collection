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

end
