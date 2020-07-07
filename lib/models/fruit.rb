class Fruit
  attr_accessor :name, :calories
  @@all = []
  def initialize(name, calories)
    @name = name
    @calories = calories
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.new_from_api(name, calories)
    self.new(name, calories)
  end
end
