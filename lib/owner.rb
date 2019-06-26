class Owner
  attr_accessor :name
  
    @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def clear

  end

end