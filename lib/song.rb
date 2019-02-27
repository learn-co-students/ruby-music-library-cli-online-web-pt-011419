class Song
  attr_accessor :name, :artist, :genre 
  
  @@all = [] # stores all song instances
  
  def initialize(name, artist=nil, genre=nil) # optional artist and genre
    @name = name
    self.artist= artist if artist != nil # run #artist= if given artist
    self.genre= genre if genre != nil # run #genre= if given genre
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(song) # instantiate and store song instance
    song = self.new(song)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def save
    @@all << self
  end
  
  def artist
    @artist
  end
  
  def artist=(artist) # song belongs to artist
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre=(genre) # song belongs to genre
    @genre = genre
    genre.add_song(self)
  end
end