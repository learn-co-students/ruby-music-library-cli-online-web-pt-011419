require_relative '../lib/concerns/memorable.rb'

class Artist 
  
  attr_accessor :name
  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(new_artist)
    artist = Artist.new(new_artist)
    artist.save
    artist
  end 
  
end 