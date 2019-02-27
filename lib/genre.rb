class Genre
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name
  
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
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
  end 
  
  def artists
    artist_arr = self.songs.collect {|song| song.artist}
    artist_arr.uniq
  end 
end