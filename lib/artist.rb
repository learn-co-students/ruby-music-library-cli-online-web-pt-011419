require_relative '../lib/concerns/memorable.rb'
require 'pry'

class Artist 
  
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
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    
    if @songs.find {|s| s == song} == nil
      @songs << song
    end 
  end
  
  def genres
    genres = self.songs.map {|song| song.genre}
    genres.uniq
  end 
  
end 