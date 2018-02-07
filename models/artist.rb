require('pg')
require_relative("../db/sql_runner.rb")

class Artist

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
  end

end
