class Genre
  # extend Concerns::Findable
  attr_accessor :name
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

  def self.create(genre)
    Genre.new(genre)
  end

  def songs
    @songs
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

end
