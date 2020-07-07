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
      puts "Type the name of a fruit to see all of its information"
      puts ""
      puts "What would you like to do:"
      input = gets.strip.downcase
      case input
      when 'q'
        return
      when 'a'
        puts ""
        display_all_fruit
        puts ""
      else
        puts "\nNot a valid option or fruit\n".red
      end
      # fruit_name = gets.strip
      # display_nutrional_info(fruit_name)
    end
  end

  def display_all_fruit
    Fruit.all.each { |fruit| puts "#{fruit.name}".colorize(fruit.color) }
  end

  def display_nutrional_info(fruit_name)
    the_fruit = Fruit.all.find { |fruit| fruit.name == fruit_name}
    puts ""
    puts "#{the_fruit.name} per 100g" 
    the_fruit.nutritions.each do |k, v| 
      if k == "calories" 
        puts "#{k}: #{v}"
      else
        puts "#{k}: #{v}g"
      end
    end
  end
end
