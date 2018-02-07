require('pg')
require_relative("../db/sql_runner.rb")

class Artist

  attr_accessor :name, :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
  end



end
