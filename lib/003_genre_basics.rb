class Genre 
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
    self.new(name).tap do|genre|#how does this return the song itself?
      genre.save
    end
  end
 
 def artists
  artists= self.songs.collect {|song| song.artist}
  artists.uniq
 end

 
end