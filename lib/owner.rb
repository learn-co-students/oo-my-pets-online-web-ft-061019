class Owner
  attr_reader :species, :name 
  attr_accessor :owner, :cats_and_dogs
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
    @cats_and_dogs = {dogs: [ ], cats: [ ]}
  end

  def self.all
    @@all
  end

  def self.count
    self.all.uniq.count 
  end  
  
  def say_species
    "I am a #{self.species}."
  end

  def self.reset_all
    @@all.clear
  end 

  def buy_cat(name)
    new_cat = Cat.new(name)
    @cats_and_dogs[:cats] << new_cat 
  end 

  def buy_dog(name)
    new_dog = Dog.new(name)
    @cats_and_dogs[:dogs] << new_dog
  end 

  def cats 
    @cats_and_dogs[:cats]     #all cats 
  end 

  def dogs 
    @cats_and_dogs[:dogs]     #all dogs 
  end 

  def walk_dogs 
    Dog.all.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil 
    end 

    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end 
  end 

  def list_pets
    "I have #{@cats_and_dogs[:dogs].length} dog(s), and #{@cats_and_dogs[:cats].length} cat(s)."
  end 
  
  


end