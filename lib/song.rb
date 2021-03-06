class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.each do |s|
      if s.name == name
        return s
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    song_t=[]
    self.all.each do |s|
      song_t << s.name
    end
    song_t.sort.collect do |s|
      self.find_by_name(s)
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(/[-.]/)
    song = self.new
    song.name = data[1].strip
    song.artist_name = data[0].strip
    return song
  end

  def self.create_from_filename(filename)
    data = filename.split(/[-.]/)
    song = self.create
    song.name = data[1].strip
    song.artist_name = data[0].strip
    return song
  end

def self.destroy_all
  self.all.clear
end


end
