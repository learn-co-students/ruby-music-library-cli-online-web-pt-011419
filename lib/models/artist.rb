class Artist
  attr_accessor :name, :songs, :genre
  @@all = []
  
  extend Concern::Findable
  
  def initialize(name)
    @name = name
    self.save
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).save
    self
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end