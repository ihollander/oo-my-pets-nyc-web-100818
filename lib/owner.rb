require 'pry'
class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each{|dog|
      dog.mood = "happy"
    }
  end

  def play_with_cats
    self.pets[:cats].each{|cat|
      cat.mood = "happy"
    }
  end

  def feed_fish
    self.pets[:fishes].each{|fish|
      fish.mood = "happy"
    }
  end

  #set all pets mood to nervous
  #release all pets from the owner
  def sell_pets
    self.pets.each{|pet_type,pets|
      pets.each{|pet|
        pet.mood = "nervous"
      }
      self.pets[pet_type] = []
    }
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end
