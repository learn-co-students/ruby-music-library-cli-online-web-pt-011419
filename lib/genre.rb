require_relative '../lib/concerns/memorable.rb'

class Genre
  attr_accessor :name, :songs
  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all
    @@all
  end 
  
  def artists 
    artists = self.songs.map {|song| song.artist}
    artists.uniq 
  end 
  
  
end