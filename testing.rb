require 'pry'

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
    s=self.new
    @@all<<s
    s
  end

  def self.new_by_name(name)
    s=self.new
    s.name=name
    s
  end

  def self.create_by_name(name)
    s=self.create
    s.name=name
    s
  end

  def find_by_name(name)
    self.all.each do |s|
      if s.name==name
        return true
      end
    end
    false
  end

end

the_middle = Song.create_by_name("The Middle")

binding.pry
