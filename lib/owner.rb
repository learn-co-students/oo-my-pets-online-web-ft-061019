require 'pry'

class Owner
  attr_accessor :pets
  attr_reader :name, :species

  #Stores all instances of owners
  @@all = []

  #Class Methods 
  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  #Instance Methods 
  def initialize(owner_name)
    @name = owner_name 
    @pets = []
    @@all << self
    @species = "human"
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    self.pets.select {|pet_obj| pet_obj.class == Cat}
  end

  def dogs
    self.pets.select {|pet_obj| pet_obj.class == Dog}
  end

  def buy_cat(cat_name)
    cat_found = Cat.all.find {|cat| cat.name == cat_name}
    if cat_found 
      self.pets << cat_found 
      cat_found.owner = self
      #binding.pry 
    else 
      new_cat = Cat.new(cat_name)
      self.pets << new_cat
      new_cat.owner = self
      #binding.pry 
    end
  end

  def buy_dog(dog_name)
    dog_found = Dog.all.find {|dog| dog.name == dog_name}
    if dog_found 
      self.pets << dog_found 
      dog_found.owner = self
    else 
      new_dog = Dog.new(dog_name)
      self.pets << new_dog
      new_dog.owner = self
    end
  end

  def walk_dogs
    self.pets.select {|pet_obj| pet_obj.class == Dog}.each {|dog_obj| dog_obj.mood = "happy"}

  end

  def feed_cats
    self.pets.select {|pet_obj| pet_obj.class == Cat}.each {|cat_obj| cat_obj.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |pet_obj| 
      pet_obj.mood = "nervous"
      pet_obj.owner = nil
    end
  end


  def list_pets
    no_of_cats = self.cats.length
    no_of_dogs = self.dogs.length
    "I have #{no_of_dogs} dog(s), and #{no_of_cats} cat(s)."
  end
 
end