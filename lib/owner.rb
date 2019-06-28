class Owner
  @@all = []
  attr_reader :species, :name

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def initialize(name)
    @species = "human"
    @name = name 
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    
    end
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def walk_dogs
    self.dogs.each {|d| d.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|c| c.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |p|
    p.owner = nil
    p.mood = "nervous"
    end
  end

  def list_pets
    n_dogs = self.dogs.length
    n_cats = self.cats.length
    return "I have #{n_dogs} dog(s), and #{n_cats} cat(s)."
  end
  
end