class MusicImporter
  attr_accessor :path, :song, :artist, :genre
  
  def initialize(path)
    @path = path
  end
  
    # returns all imported files, deletes non-MP3s
  def files 
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
  end
  
    # imports files from the directory, instantiates song for each file
  def import 
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end