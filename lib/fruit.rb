# frozen_string_literal: false

# a class to hold the fruits information inculding a hash of nutritional facts
module FruitInfo
  class Fruit
    attr_accessor :genus, :name, :id, :family, :order, :nutritions, :color
    @@all = []
    def initialize(attributes)
      attributes.each { |k, v| send("#{k}=", v) }
      add_color
      @@all << self
    end

    def self.max(element)
      all.max { |a, b| a.nutritions[element] <=> b.nutritions[element] }
    end

    def self.min(element)
      all.min { |a, b| a.nutritions[element] <=> b.nutritions[element] }
    end

    def add_color
      case name
      when 'Apricot'
        self.color = :yellow
      when 'Banana'
        self.color = :light_yellow
      when 'Blueberry'
        self.color = :blue
      when 'Cherry'
        self.color = :red
      when 'Apple'
        self.color = :green
      when 'Lemon'
        self.color = :light_yellow
      when 'Mango'
        self.color = :yellow
      when 'Orange'
        self.color = :yellow
      when 'Pear'
        self.color = :green
      when 'Pineapple'
        self.color = :light_yellow
      when 'Raspberry'
        self.color = :light_red
      when 'Strawberry'
        self.color = :red
      when 'Tomato'
        self.color = :red
      when 'Watermelon'
        self.color = :light_green
      when 'Guava'
        self.color = :light_green
      else
        self.color = :white
      end
    end

    def self.all
      @@all
    end

    def self.new_from_api(fruits)
      fruits.each { |fruit| new(fruit) }
    end
  end
end
