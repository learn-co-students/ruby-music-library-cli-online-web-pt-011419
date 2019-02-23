class Artist
  attr_accessor :name, :songs#, :genre
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
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

  def self.create(artist)
    Artist.new(artist)
  end

  def add_song(song)
    if song.artist == nil
      @songs << song
      song.artist = self
    end
  end

  def genres
binding.pry
    @@all.collect do |song|
      song.genre
    end
  end

end
