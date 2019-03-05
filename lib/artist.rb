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
    song.artist = self
    song
  end
  
end 