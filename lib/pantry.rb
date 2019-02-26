require 'pry'

class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(object)
    @stock[object]
  end

  def restock(object, amount)
    @stock[object] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |key, value|
    stock_check(key) >= value
    end
  end
end
