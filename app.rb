require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'lib/cookbook.rb'
require_relative 'lib/view'
require_relative 'lib/recipe'
# require_relative 'lib/scraper'
# require 'nokogiri'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new('lib/recipes.csv')
  erb :index
end

post '/recipes' do
  Cookbook.new('lib/recipes.csv').add_recipe(Recipe.new(params[:name], params[:description], params[:preparation_duration], params[:difficulty]))
  redirect to '/'
end

get '/destroy/:index' do
  Cookbook.new('lib/recipes.csv').remove_recipe(params[:index].to_i)
  redirect to '/'
end

get '/new' do
  erb :new
end

# get '/import' do
#   erb :import
# end

# get '/import/:index' do
#   Cookbook.new('lib/recipes.csv').add_recipe(@list_of_recipes[params[:index]])
#   redirect to '/'
# end


# get '/choose-recipe' do
#   erb :choose_recipe
# end
# post '/import' do
#   @list_of_recipes = Scraper.new(params[:keyword])
#   redirect to '/choose-recipe'
# end


