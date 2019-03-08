class MusicLibraryController
  
  attr_accessor :path
  
  def initiate(path = "./db/mp3s")
    @path = path
  end 
end 