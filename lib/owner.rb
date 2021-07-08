require "pry"

class Owner
  
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
  end
  
  def say_species
    "I am a #{@species}."
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
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
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.length} cat(s)."
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet|
      sell_pet(pet)
    end
  end

  def sell_pet(pet)
    pet.owner = nil
    pet.mood = "nervous"
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end


end