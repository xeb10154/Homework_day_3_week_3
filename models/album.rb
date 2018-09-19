require("pg")
require_relative("../models/artist")

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING id
    "

    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    result.map {|album_hash| Album.new(album_hash)}
  end

  def update()
    sql = "UPDATE albums SET title = $1 WHERE id = $2"

    values = [@title, @id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"

    values = [@id]
    SqlRunner.run(sql, values)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"

    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    binding.pry
    Artist.new(result[0])
    # This example assumes that each album only has one artist at index 0. If there is more than one artist i.e. artist collaboration, then the result variable would need to be mapped to show the hash in an array with multiple artists.
  end


end
