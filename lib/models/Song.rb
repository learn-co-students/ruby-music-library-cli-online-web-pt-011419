require 'pry'
class Song
  attr_accessor :name, :artist, :genre  
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil )
    @name = name
    self.artist= artist if artist  
    self.genre= genre if genre 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
    
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
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
   song = self.new(name)
   song.save
   song
 end 
 
  def self.find_by_name(name)
   @@all.detect {|artist| artist.name == name } 
 end 
 
 def self.create_from_filename(name)
   song = self.new(name)
 end 
 
 def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
 end 
 
 def self.new_from_filename(file)
   song_name = file.split(" - ")[1]
   artist_name = file.split(" - ")[0]
   genre_name = file.split(" - ")[2].chomp(".mp3")
   a = Artist.find_or_create_by_name(artist_name)
   g = Genre.find_or_create_by_name(genre_name)
   song = Song.new(song_name, a, g)
 end 
 
 def self.create_from_filename(file)
   new_from_filename(file).save 
 end 
 end 
