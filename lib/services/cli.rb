class CLI
  def call
    FruityviceAPI.new.make_fruits
    puts "Welcome to fruit!"
    input = nil
    while input != 'q'
      puts "Press " + "a".red + " to see all fruit"
      puts "Press " + "s".yellow + " to see all fruit listed with their scientific names"
      puts "Press " + "n".light_yellow + " to see all fruit listed with their nutrional information"
      puts "Press " + "m".green + " to see the fruits with most nutrition"
      puts "Press " + "l".cyan + " to see the fruits with least nutrition"
      puts "Type the " + "name of a fruit ".blue + "to see all of its information"
      puts "Press " + "q".magenta + " to quit\n"
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
      when 'l'
        display_the_least
      else
        if Fruit.all.find { |fruit| fruit.name.downcase == input} != nil
          display_one_fruit(Fruit.all.find { |fruit| fruit.name.downcase == input})
        else
          puts "\nNot a valid option or fruit in database\n".red
        end
      end
    end
  end

  def display_the_least
    puts "\nThe fruits with the least nutrition per 100g".colorize(:magenta)
    least_carb = Fruit.min("carbohydrates")
    least_protein = Fruit.min("protein")
    least_fat = Fruit.min("fat")
    least_calories = Fruit.min("calories")
    least_sugar = Fruit.min("sugar")

    puts "\nLeast carbohydrates: #{least_carb.name} @ #{least_carb.nutritions["carbohydrates"]}g".colorize(least_carb.color)
    puts "Least protein: #{least_protein.name} @ #{least_protein.nutritions["protein"]}g".colorize(least_protein.color)
    puts "Least fat: #{least_fat.name} @ #{least_fat.nutritions["fat"]}g".colorize(least_fat.color)
    puts "Least calories: #{least_calories.name} @ #{least_calories.nutritions["calories"]}".colorize(least_calories.color)
    puts "Least sugar: #{least_sugar.name} @ #{least_sugar.nutritions["sugar"]}g\n".colorize(least_sugar.color)
  end

  def display_the_most
    puts "\nThe fruits with the most nutrition per 100g".colorize(:cyan)
    most_carb = Fruit.max("carbohydrates")
    most_protein = Fruit.max("protein")
    most_fat = Fruit.max("fat")
    most_calories = Fruit.max("calories")
    most_sugar = Fruit.max("sugar")

    puts "\nMost carbohydrates: #{most_carb.name} @ #{most_carb.nutritions["carbohydrates"]}g".colorize(most_carb.color)
    puts "Most protein: #{most_protein.name} @ #{most_protein.nutritions["protein"]}g".colorize(most_protein.color)
    puts "Most fat: #{most_fat.name} @ #{most_fat.nutritions["fat"]}g".colorize(most_fat.color)
    puts "Most calories: #{most_calories.name} @ #{most_calories.nutritions["calories"]}".colorize(most_calories.color)
    puts "Most sugar: #{most_sugar.name} @ #{most_sugar.nutritions["sugar"]}g\n".colorize(most_sugar.color)
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
