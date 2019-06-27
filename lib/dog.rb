class Dog
  attr_accessor :mood, :owner 
  attr_reader :name
  @@all = []
  def initialize(name, owner = nil, mood ="nervous")
    @wner = owner
    @name = name
    @mood = mood
    @@all << self
  end

  def self.all
    @@all
  end
 
end