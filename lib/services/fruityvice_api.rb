class FruityviceAPI
  BASE_URL = "https://www.fruityvice.com/api/fruit/all"

  def get_fruits
    fruits = JSON.parse(HTTParty.get(BASE_URL, :verify=> false))
  end

  def make_fruits
    get_fruits.each do |fruit|
      # binding.pry
      Fruit.new_from_api(fruit["name"], fruit["nutritions"]["calories"])
    end
  end
end
