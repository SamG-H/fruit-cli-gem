class CLI
  def call
    FruityviceAPI.new.make_fruits
    puts "Welcome to fruit!"
    input = nil
    while input != 'q'
      puts "Press q to quit"
      puts "Press a to see all fruit"
      puts "Press s to see all fruit with their scientific names"
      puts "Press n to see all fruit with their nutrional information"
      puts "Type the name of a fruit to see all of its information\n"
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
      else
        if Fruit.all.find { |fruit| fruit.name.downcase == input} != nil
          display_one_fruit(Fruit.all.find { |fruit| fruit.name.downcase == input})
        else
          puts "\nNot a valid option or fruit\n".red
        end
      end
    end
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
