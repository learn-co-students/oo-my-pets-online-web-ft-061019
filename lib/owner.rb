require "pry"

class Owner
  
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @cats = []
    @dogs = []
  end
  
  def say_species
    "I am a #{@species}."
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
    @dogs << dog
    
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
    @cats << cat
  end

  def walk_dogs
    @dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
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