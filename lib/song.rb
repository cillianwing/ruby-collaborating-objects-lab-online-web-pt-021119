require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    split_name = file.chomp(".mp3").split(" - ")
    song = Song.new(split_name[1])
    song.artist_name = split_name[0]
    song
  end

end
