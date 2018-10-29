require_relative 'view'
require_relative 'scraper'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @cookbook.all.each_with_index do |recipe, index|
      @view.display(recipe, index)
    end
  end

  def import
    keyword = @view.ask_user_for_keyword
    list_of_recipes = Scraper.new(keyword).all
    list_of_recipes.each_with_index do |recipe, index|
      @view.display_to_import(recipe, index)
    end
    index = @view.ask_user_for_index_to_import
    @cookbook.add_recipe(list_of_recipes[index])
  end

  def create
    recipe = @view.create_new_recipe
    @cookbook.add_recipe(recipe)
  end

  def destroy
    recipe_index = @view.destroy_index
    @cookbook.remove_recipe(recipe_index)
  end

  def mark_as_done
    index = @view.ask_for_index_to_mark
    @cookbook.mark_as_done_at_index(index)

  end
end
