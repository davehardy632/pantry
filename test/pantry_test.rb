require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require 'pry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_empty_pantry_stock
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_stock_check
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.stock_check(@cheese)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.stock_check(@cheese)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 8)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
