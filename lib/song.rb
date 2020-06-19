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
  
  def self.find_or_create_by_name(name) # runs #find_by_name or runs #create
    self.find_by_name(name) || self.create(name)
  end
  
    # splits filenames into array, set variables to each index for each attribute
    # sets artist and genre attributes to their objects using #find_or_create_by_name
    # instantiates a new song based on the filename, complete with artist and genre
  def self.new_from_filename(filename)
    files = filename.split(" - ")
    artist_name = files[0]
    song_name = files[1]
    genre_name = files[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
    # runs #new_from_filename and then saves the instance to @@all
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
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