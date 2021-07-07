require 'pry'

class Song
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name, :genre
  attr_reader :artist
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil 
    self.genre=(genre) if genre != nil
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song 
  end
  
  def self.new_from_filename(filename)
    artist, song, genre = filename.gsub!(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song = self.new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end