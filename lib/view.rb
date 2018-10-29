class View
  def destroy_index
    puts "Which one do you want to destroy (N°) ?"
    gets.chomp.to_i - 1
  end

  def create_new_recipe
    puts "What is the name of the recipe ?"
    name = gets.chomp
    puts "What is the description (optional)?"
    description = gets.chomp
    puts "How long it takes to prepare (optional)"
    time = gets.chomp
    puts "Difficulty ? 1 to 4 (optional)"
    difficulty = gets.chomp
    Recipe.new(name, description, time, difficulty)
  end

  def display(recipe, index)
    x = recipe.done ? "X" : " "
    return "#{index + 1}. [#{x}] #{recipe.name}  (#{recipe.time}) difficulty : #{recipe.difficulty}\n#{recipe.description}\n\n"
  end

  def display_to_import(recipe, index)
    puts "#{index + 1}. #{recipe.name}  (#{recipe.time}) difficulty : #{recipe.difficulty}\n#{recipe.description}\n\n"
  end

  def ask_user_for_keyword
    puts "What do you want to cook ?"
    gets.chomp
  end

  def ask_user_for_index_to_import
    puts "Which one do you want to import (N°) ?"
    gets.chomp.to_i - 1
  end

   def ask_for_index_to_mark
    puts "Which one do you want to mark as done (N°) ?"
    gets.chomp.to_i - 1
  end
end
