require 'pry'
class Owner
  # code goes here
  attr_accessor :cats, :dogs
  attr_reader :species, :name
  @@owners = []
  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
    @cats = []
    @dogs = []
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.uniq.count
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.concat(self.cats).each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end