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
  

  
  # def self.destroy_all
  #   self.all.clear
  # end 
  
  # def save 
  #   @@all << self 
  # end 
  
  # def self.create(new_song)
  #   song = Song.new(new_song)
  #   song.save
  #   song
  # end 
end