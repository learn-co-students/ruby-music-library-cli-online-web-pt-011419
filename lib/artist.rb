class Artist
  # extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
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
    self.songs << song unless self.songs.include?(song)
#need 2 steps - first songs should add to songs if it doesnt already include it. Then it should add artist if it doesn't already have it
    if song.artist == nil
      song.artist = self
    end
  end

  def genres

    self.songs.collect do |song|
      song.genre
    end.uniq
  end

end
