require_relative '../lib/concerns/memorable.rb'

class Song 
  
  attr_accessor :name, :artist
  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  @@all = []
  
  def initialize(name, artist = "unknown")
    @name = name
    @artist = artist
  end 
  
  def self.all
    @@all
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