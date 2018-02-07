require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

artist1 = Artist.new(
  'name' => "Green Day"
);

artist1.save()








binding.pry
nil
