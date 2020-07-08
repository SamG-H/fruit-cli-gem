class CLI
  def call
    FruityviceAPI.new.make_fruits
    puts "Welcome to fruit!"
    input = nil
    while input != 'q'
      puts "Press " + "a".red + " to see all fruit"
      puts "Press " + "s".red + " to see all fruit with their scientific names"
      puts "Press " + "n".red + " to see all fruit with their nutrional information"
      puts "Press " + "m".red + " to see all fruit with their nutrional information"
      puts "Type the " + "name of a fruit ".red + "to see all of its information"
      puts "Press " + "q".red + " to quit\n"
      print "What would you like to do: "
      input = gets.strip.downcase
      case input
      when 'q'
        return
      when 'a'
        display_all_fruit
      when 's'
        display_fruits_with_scientific_names
      when 'n'
        display_nutrional_info
      when 'm'
        display_the_most
      else
        if Fruit.all.find { |fruit| fruit.name.downcase == input} != nil
          display_one_fruit(Fruit.all.find { |fruit| fruit.name.downcase == input})
        else
          puts "\nNot a valid option or fruit\n".red
        end
      end
    end
  end

  def display_the_most
    puts "\nThe fruits with the most nutrition per 100g".colorize(:cyan)
    most_carb = Fruit.max("carbohydrates")
    most_protein = Fruit.max("protein")
    most_fat = Fruit.max("fat")
    most_calories = Fruit.max("calories")
    most_sugar = Fruit.max("sugar")
    
    puts "\nMost carbohydrates: #{most_carb.name} @ #{most_carb.nutritions["carbohydrates"]}".colorize(most_carb.color)
    puts "Most protein: #{most_protein.name} @ #{most_protein.nutritions["protein"]}".colorize(most_protein.color)
    puts "Most fat: #{most_fat.name} @ #{most_fat.nutritions["fat"]}".colorize(most_fat.color)
    puts "Most calories: #{most_calories.name} @ #{most_calories.nutritions["calories"]}".colorize(most_calories.color)
    puts "Most sugar: #{most_sugar.name} @ #{most_sugar.nutritions["sugar"]}\n".colorize(most_sugar.color)
  end

  def display_one_fruit(fruit)
    puts "\n#{fruit.name} - #{fruit.order} #{fruit.family} #{fruit.genus}".colorize(fruit.color)
    fruit.nutritions.each do |k, v| 
      if k == "calories" 
        puts "#{k}: #{v}".colorize(:color => :black, :background => fruit.color)
      else
        puts "#{k}: #{v}g".colorize(:color => :black, :background => fruit.color)
      end
    end
    puts ""
  end

  def display_all_fruit
    puts ""
    Fruit.all.each { |fruit| puts "#{fruit.name}".colorize(fruit.color) }
    puts ""
  end

  def display_nutrional_info
    puts ""
    Fruit.all.each do |fruit|
      puts "#{fruit.name}".colorize(fruit.color) + " per 100g" 
      fruit.nutritions.each do |k, v| 
        if k == "calories" 
          puts "#{k}: #{v}".colorize(:color => :black, :background => fruit.color)
        else
          puts "#{k}: #{v}g".colorize(:color => :black, :background => fruit.color)
        end
      end
      puts ""
    end
  end

  def display_fruits_with_scientific_names
    puts ""
    Fruit.all.each { |fruit| puts "#{fruit.name}: #{fruit.order} #{fruit.family} #{fruit.genus}".colorize(fruit.color) }
    puts ""
  end
end
