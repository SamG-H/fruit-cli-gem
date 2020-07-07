class FruityviceAPI
  BASE_URL = "https://www.fruityvice.com/api/fruit/all"

  def get_fruits
    fruits = JSON.parse(HTTParty.get(BASE_URL, :verify=> false))
  end

  def make_fruits
    Fruit.new_from_api(get_fruits)
  end
end
