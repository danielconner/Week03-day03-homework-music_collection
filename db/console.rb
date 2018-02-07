require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  'name' => "Green Day"
);

artist1.save()

album1 = Album.new(
  'title' => 'Dookie',
  'genre' => 'Punk',
  'artist_id' => artist1.id
);

album1.save()



binding.pry
nil
