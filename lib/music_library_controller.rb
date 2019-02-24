class MusicLibraryController
attr_accessor :path, :MusicImporter
# @@MusicImporter = []

  def initialize(path = "./db/mp3s")
    # @path = path
    MusicImporter.new(path)
    # @@MusicImporter << path
  end
end
