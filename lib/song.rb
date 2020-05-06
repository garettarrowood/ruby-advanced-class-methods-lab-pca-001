class Song
  attr_accessor :name, :artist_name

  #### SAME AS
  # attr_reader :name, :artist_name
    #### SAME AS
      # def name
      #   @name
      # end
      # def artist_name
      #   @artist_name
      # end
    ####
  # attr_writer :name, :artist_name
  ####

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new.save
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name }
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]

    song = new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
