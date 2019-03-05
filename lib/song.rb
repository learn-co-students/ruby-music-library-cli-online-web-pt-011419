class Song 
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(new_song)
    song = Song.new(new_song)
    song.save
    song
  end 
end