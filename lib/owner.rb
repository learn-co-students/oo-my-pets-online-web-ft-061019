require "pry"
class Owner
  attr_reader :species, :name
  attr_accessor  :dogs, :cats

  @@all = []
  

  def initialize(name, species = "human")
    @name = name
    @species = species
    @cats = []
    @dogs = []
    @@all << self
  end 

  def say_species
    "I am a #{species}."

  end 
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 

  def dogs
    Dog.all.select do |dog|
      dog.owner == self 
    end 
  end 

  def buy_cat(name)
    @cats << Cat.new(name, self)
    
  end 

  def buy_dog(name)
    @dogs << Dog.new(name, self)
  end 

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end 
  end 

  def sell_pets
    all_pets = dogs + cats 
      all_pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      
  
    
  end 

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end 

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end 
end

