require_relative '../lib/concerns/memorable.rb'

class Genre
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

end