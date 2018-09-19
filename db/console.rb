require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Adele"
  })

  artist1.save()

  artist2 = Artist.new({
    "name" => "Beyonce"
    })

    artist2.save()

    album1 = Album.new({
      "title" => "21",
      "genre" => "pop",
      "artist_id" => artist1.id
      })
      album1.save()

      album2 = Album.new({
        "title" => "lemonade",
        "genre" => "RnB",
        "artist_id" => artist2.id
        })

        album2.save()

        


        binding.pry
        nil
