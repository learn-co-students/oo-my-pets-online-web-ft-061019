class Dog
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@dogs = []
  def initialize(name, owner, mood="nervous")
    @name = name
    @owner = owner
    @owner.dogs << self
    @mood = mood
  end

  def self.all
    @@dogs
  end
end