class Cat
  attr_accessor :mood, :owner
  attr_reader :name, :species

  #Allows the Cat class to keep track of all Cats 
  @@all = []

  def initialize(name, owner="")
    @name = name
    self.mood = "nervous"
    @@all << self
    @species = "cat"
    @owner = owner unless owner == ""
    @owner.pets << self unless owner == ""
  end

  def self.all
    @@all
  end

  def say_species
    puts @species
  end

end