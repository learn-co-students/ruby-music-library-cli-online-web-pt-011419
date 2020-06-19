class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(path).select {|s| s.include?(".mp3")}
  end
  
  def import
    files.each { |s| Song.create_from_filename(s)
    }
  end
  
  
end