require 'csv'
require_relative 'recipe'
require 'pry-byebug'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(csv_file_path, csv_options) do |row|
      done = row[4] == "true"
      new_recipe = Recipe.new(row[0], row[5], row[1], row[2], row[3], done)
      @recipes << new_recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |current_recipe|
        csv << [current_recipe.name, current_recipe.time, current_recipe.difficulty, current_recipe.url, current_recipe.done, current_recipe.description]
      end
    end
  end

  def mark_as_done_at_index(index)
    @recipes[index].done = true
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |current_recipe|
        csv << [current_recipe.name, current_recipe.time, current_recipe.difficulty, current_recipe.url, current_recipe.done, current_recipe.description]
      end
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |current_recipe|
        csv << [current_recipe.name, current_recipe.time, current_recipe.difficulty, current_recipe.url, current_recipe.done, current_recipe.description]
      end
    end
  end
end

