class Artist
  attr_accessor :name, :songs 
  
  @@all = [] # stores all artist instances
  
  def initialize(name)
    @name = name
    @songs = [] # stores all songs for each artist 
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(artist) # instantiate and store artist instance
    artist = self.new(artist)
    artist.save
    artist
  end
  
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song) # artist has many songs
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
    song
  end
  
  def genres
    @genres = []
    @songs.each do |song|
      @genres << song.genre unless @genres.include?(song.genre)
    end
    @genres
  end
end