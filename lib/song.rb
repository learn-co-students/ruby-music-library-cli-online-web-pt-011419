class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    @@all << self
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

  def self.create(song)
    Song.new(song)
  end

  def artist=(artist)
  end
end
