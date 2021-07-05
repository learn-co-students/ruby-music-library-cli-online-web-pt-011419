require "pry"
class Artist 
  extend Concerns::Findable
 attr_accessor :name, :songs
 
 @@all=[]
 def initialize(name)
   @name=name
   @songs=[]
 end
 
 def self.all
   @@all
 end

def save 
  @@all<< self
end

def self.destroy_all
  all.clear
end 

 def self.create(name)
    self.new(name).tap do|artist|#how does this return the song itself?
      artist.save
    end
  end
 
 def add_song(song)
   if song.artist == nil
     song.artist=self
    end
   if @songs.include?(song) == false
    @songs<< song
  end
 end 
   def songs
     @songs
   end
 
  def genres
   genres= self.songs.collect {|song|
      song.genre}
   genres.uniq
   end
   
 
end