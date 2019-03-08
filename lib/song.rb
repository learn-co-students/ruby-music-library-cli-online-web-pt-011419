require_relative '../lib/concerns/memorable.rb'
require_relative '../lib/concerns/findable.rb'
require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Memorable::ClassMethods, Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  
  @@all = []
  
  def initialize(name, art = "unknown", gen = "unknown")
    @name = name
    if art != "unknown"
      self.artist = art
    end
    if gen != "unknown"
      self.genre = gen
    end  
  end 
  
  def self.all
    @@all
  end 
  
  def artist=(a)
    @artist = a 
    
    a.add_song(self)
  end 
  
  def genre=(g)
    @genre = g 
    if g.songs.find {|s| s == self} == nil
      g.songs << self
    end
  end 
  
  def self.new_from_filename (filename)
    file = filename.split(/ - |[.]/)
    songname = file[1] 
    artname = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2])
    Song.new(songname, artname, genre)
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
end