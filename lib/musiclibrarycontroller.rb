require 'pry'
class MusicLibraryController
  attr_accessor :path 
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
   input = gets.strip
  i += 1
  if i == 4 || input == "exit"
    break
  elsif input == "list songs"
    list_songs
    elsif input == "list artists"
    list_artists
    elsif input == "list genres"
    list_genres
    elsif input == "list artist"
    list_songs_by_artist 
    elsif input == "list genre"
    list_songs_by_genre
    elsif input == "play song"
    play_song
  end
 end
end
  def list_songs
   list = Song.all.sort_by! do |songA| 
     songA.name
   end
   list.each.with_index(1) do |song, i|
     puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
 # binding.pry
end
  def list_artists
  list = Artist.all.sort_by! do |artist| 
    artist.name
    end
    list.each.with_index(1) do |artist, i|
     puts "#{i}. #{artist.name}"
    end
  end
  def list_genres
  list = Genre.all.sort_by! do |genre| 
    genre.name
   end
   list.each.with_index(1) do |genre, i|
     puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    song_list = []
    Song.all.each do |song|
    if song.artist.name == input
      song_list << song 
    end 
  end
  song_list = song_list.sort_by{|song| song.name}
  song_list.each {|song| puts "#{song_list.index(song) + 1}. #{song.name} - #{song.genre.name}" }
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    songs_genre = []
    Song.all.each do |song|
      if song.genre.name == input
        songs_genre << song
      end
    end
  songs_genre = songs_genre.sort_by{|song| song.genre}
  songs_genre.each {|song| puts "#{songs_genre.index(song) + 1}. #{song.artist.name} - #{song.name}" }
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
   if Song.all.length + 1 >= input && input > 0
     song = Song.all.sort_by! { |songA| songA.name}[input - 1]
     puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
end

