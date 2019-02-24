class MusicLibraryController
attr_accessor :path, :MusicImporter
# @@MusicImporter = []

  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    i = 0
    loop do
      input = gets.chomp
      i += 1
      if i == 4 || input == "exit"
        break

      end
    end
  end

  def list_songs
    lala = Song.all.sort_by! do |song|
      song.name
    end
    lala.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_name = Song.all.sort_by! do |song|
      song.artist.name
    end
    artist_name.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name}"
    end
  end
end
