class Genre
  attr_accessor :name, :songs 
  
  @@all = [] # stores all genre instances
  
  def initialize(name)
    @name = name
    @songs = [] # stores all songs for each genre
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(genre) # instantiate and store artist instance
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song) # genre has many songs
    song.genre = self unless song.genre != nil
    @songs << song unless @songs.include?(song)
    song
  end
  
    def artists
    @artists = []
    @songs.each do |song|
      @artists << song.artist unless @artists.include?(song.artist)
    end
    @artists
  end
end