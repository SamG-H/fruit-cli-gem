class FruityviceAPI
  BASE_URL = 'https://www.fruityvice.com/api/fruit/all'

  fruits = HTTParty.get(BASE_URL)
end
