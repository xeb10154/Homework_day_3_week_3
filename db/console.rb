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

        album3 = Album.new({
          "title" => "19",
          "genre" => "pop",
          "artist_id" => artist1.id

          })
          album3.save()


        artist2.name = "Beyonce Update"
        artist2.update()

        album1.title = "25"
        album1.update()

        album2.delete()
        artist2.delete() # Deleting artists only works if there are no related dependents i.e. albums.
        # So always delete dependent first before deleting primary object.

        artist1.album()

        album1.artist()


        binding.pry
        nil
