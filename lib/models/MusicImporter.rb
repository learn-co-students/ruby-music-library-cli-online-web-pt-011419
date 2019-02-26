class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files
  Dir.entries(path).select {|file| file.include?(".mp3")}
  end 
  
  def import(list_of_filenames)
   list_of_filenames.each {|filename| Song.new_by_filename(filename)}
  end 
end 