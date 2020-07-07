class CLI
  def call
    FruityviceAPI.new.make_fruits
    puts "Look at all this fruit"
    display_all_fruit
  end

  def display_all_fruit
    Fruit.all.each { |fruit| puts "#{fruit.name} has #{fruit.calories} calories!"}
  end
end
