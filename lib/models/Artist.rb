require 'pry'

 class Artist
 
 extend Concerns::Findable
 
 attr_accessor :name, :songs, :genre 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
 
 def genres
  genre = songs.collect {|song| song.genre}
  genre.uniq 
 end 
 
 def self.create(name)
   artist = self.new(name)
   artist.save
   artist
  end
  
  def add_song(song)
  song.artist = self if !song.artist
  # if !song.artist
    # song.artist = self
   #end
   @songs << song unless @songs.include?(song)
  end 
end