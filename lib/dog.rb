class Dog
  attr_accessor :mood, :owner
  attr_reader :name, :species

  #Allows the Dog class to keep track of all dogs 
  @@all = []

  def initialize(name, owner="")
    @name = name
    self.mood = "nervous"
    @@all << self
    @species = "dog"
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