class Fruit
  attr_accessor :genus, :name, :id, :family, :order, :nutritions, :color 
  @@all = []
  def initialize(attributes)
    attributes.each { |k, v| self.send("#{k}=", v) }
    self.add_color
    @@all << self
  end

  def self.max(element)
    self.all.max { |a, b| a.nutritions[element] <=> b.nutritions[element]}
  end

  def self.min(element)
    self.all.min { |a, b| a.nutritions[element] <=> b.nutritions[element]}
  end

  def add_color
    case self.name
    when "Banana"
      self.color = :light_yellow
    when "Blueberry"
      self.color = :blue
    when "Cherry"
      self.color = :red
    when "Apple"
      self.color = :green
    when "Lemon"
      self.color = :light_yellow
    when "Mango"
      self.color = :yellow
    when "Orange"
      self.color = :yellow
    when "Pear"
      self.color = :green
    when "Pineapple"
      self.color = :light_yellow
    when "Raspberry"
      self.color = :light_red
    when "Strawberry"
      self.color = :red
    when "Tomato"
      self.color = :red
    when "Watermelon"
      self.color = :light_green
    end
  end

  def self.all
    @@all
  end

  def self.new_from_api(fruits)
    fruits.each { |fruit| self.new(fruit) }
  end
end
