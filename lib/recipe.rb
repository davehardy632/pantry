require 'pry'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(object, amount)
    @ingredients_required[object] = amount
  end

  def amount_required(ingredient)
      amount = 0
      @ingredients_required.each do |key, value|
      if key.name == ingredient.name
      amount += value
      end
    end
    amount
  end

  def ingredients
    list = []
    @ingredients_required.each do |key, value|
      list << key
    end
    list
  end

  def total_calories
    @ingredients_required.sum do |key, value|
    key.calories * value
    end
  end
end
