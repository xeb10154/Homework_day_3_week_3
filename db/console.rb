require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({
  "name" => "Adele"
  })

  artist2 = Artist.new({
    "name" => "Beyonce"
    })

    # album1 = Album.new({
    #   "title" => "21",
    #   "genre" => "pop",
    #   "artist_id" => artist1.id
    #   })
    #
    #   album2 = Album.new({
    #     "title" => "lemonade",
    #     "genre" => "RnB",
    #     "artist_id" => artist2.id
    #     })

artist1.save()
artist2.save()

binding.pry
nil
