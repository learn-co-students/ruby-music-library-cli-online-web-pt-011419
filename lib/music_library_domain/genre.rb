class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
 def initialize(name)
   @songs = []
   @name = name
 end
 
 def songs 
   @songs
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
   genre = new(name)
   genre.save
   genre
 end
 
 def artists
   songs.collect do |s|
     s.artist
   end.uniq
 end
  
end


