class Recipe
  attr_reader :name, :time, :difficulty, :description, :url
  attr_accessor :done
  def initialize(name, description = "unknown", time = "unknown", difficulty = "unknown", url = "unknown", done = false)
    @name = name
    @description = description
    @difficulty = difficulty
    @time = time
    @url = url
    # @difficulty = difficulty
    @done = done
  end
end
