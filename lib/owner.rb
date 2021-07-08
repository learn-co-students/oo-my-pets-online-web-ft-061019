require 'pry'
class Owner
 attr_reader :species, :name
  attr_accessor :pets
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {:dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  
  def cats
    @pets[:cats]
  end 
  
  def dogs
    @pets[:dogs]
  end 
  
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end 
  

  def walk_dogs
    Dog.all.each {|d| d.mood = "happy"}
  end 
   
   def feed_cats
     Cat.all.each {|c| c.mood = "happy"}
   end 
   
   def sell_pets
     Cat.all.each do |c| 
       c.mood = "nervous"
       c.owner = nil
     end 
     Dog.all.each do |d|
       d.mood = "nervous"
       d.owner = nil
     end 
    
   end 
  def list_pets
   "I have #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
 end
end
