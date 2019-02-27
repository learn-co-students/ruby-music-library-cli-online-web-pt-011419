class MusicLibraryController
  attr_accessor :path
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call 
    puts "Welcome!"
    
  end
end