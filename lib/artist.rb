require_relative '../lib/concerns/memorable.rb'
require 'pry'

class Artist 
  
  attr_accessor :name, :songs
  attr_reader :genres
  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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
  
  def genres=(g)
    binding.pry
    self.songs.each do |s|
      if self.genres.find {|g| g == s.genre} == nil 
        @genres << s.genre
      end
    end 
  end 
  
end 