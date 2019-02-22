require 'pry'
class Song 
  attr_accessor :name 
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
   def save
     @@all << self
   end
   def self.create(name)
     new_song = Song.new(name)
     new_song.save
     new_song
   end
   def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end
    def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
   end
   def self.find_by_name(song_name)
     all.find {|song| song.name == song_name}
   end
   def self.find_or_create_by_name(song_name)
     song = self.find_by_name(song_name)
       if song == nil 
         self.create(song_name)
       else
         song
       end
     end
   def self.new_from_filename(file_name)
     #file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2].gsub(".mp3", ""))
    song = Song.new(file_bits[1],artist,genre)
    #song.genre = genre
    ##song.artist = artist
    #song
  end
    def self.create_from_filename(file_name)
     file = Song.new_from_filename(file_name)
     file.save
   end
end