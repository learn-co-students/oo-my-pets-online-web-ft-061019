class Cat
  attr_accessor :mood, :owner
  attr_reader :name
  @@all = []

  def initialize(name, owner = nil)
    @name = name
    @mood = "nervous"
    @@all << self
    @owner = owner
  end

  def self.all
    @@all
  end
end
