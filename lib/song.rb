require_relative '../lib/concerns/memorable.rb'
require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
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
  
  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end 
  
  def self.create_by_name(name)
    self.new(name)
    
  end 
  
  def self.find_or_create_by_name 
    self.all.find_by_name(name) || 
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