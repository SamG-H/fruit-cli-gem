# frozen_string_literal: false

# accesses the fruityvice api, parses it, and calls Fruit class to make fruit from parsed hash
class FruityviceAPI
  BASE_URL = 'https://www.fruityvice.com/api/fruit/all'

  def access_fruityviceapi
    JSON.parse(HTTParty.get(BASE_URL, verify: false))
  end

  def make_fruits
    Fruit.new_from_api(access_fruityviceapi)
  end
end
