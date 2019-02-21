class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    
    @path = path
  end
  def files
    Dir.glob("#{path}*/**").collect {|file| file.gsub( "./spec/fixtures/mp3s/", "")} 
  end
  def import
    new_file = self.files
    new_file.each {|file| Song.create_from_filename(file)}
  end
  
end