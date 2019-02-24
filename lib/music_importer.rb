class MusicImporter
attr_accessor :path

  def initialize(path)
    @path = path

  end

  def files
    files = Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end

  def import
    binding.pry
    Song.create_from_filename(files)
  end
end
