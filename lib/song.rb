class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #evoking self.artist if there is an artist. Otherwise, it will do artist= method
    self.genre = genre if genre
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    Song.new(song)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(name)
    artist, song, genre = name.split(" - ")
    genre = genre.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end
