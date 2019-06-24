class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@cats = []
  def initialize(name, owner, mood="nervous")
    @name = name
    @owner = owner
    @owner.cats << self
    @mood = mood
  end

  def self.all
    @@cats
  end
end