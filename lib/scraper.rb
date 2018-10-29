# main-title
require 'nokogiri'
require 'open-uri'
require_relative "recipe"

class Scraper
  def initialize(keyword)
    @keyword = keyword
    @list_of_recipes = scrape_recipes(@keyword)
  end

  def all
    @list_of_recipes
  end

  def scrape_recipes(keyword)
    @list_of_recipes = []
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search(".recipe-card").take(5).each do |element|
      title = element.search(".recipe-card__title").text
      time = element.search(".recipe-card__duration").text.gsub(/[^$\d* [min|h]]/, "").strip
      url = "https://www.marmiton.org" + element.search(".recipe-card-link").attribute("href").value
      description = element.search(".recipe-card__description").text.strip
      doc = Nokogiri::HTML(open(url), nil, 'utf-8')
      difficulty = doc.search(".recipe-infos__level div")[0].attributes.values[0].value.split("").last

      @list_of_recipes << Recipe.new(title, description, time, difficulty, url)
    end
    return @list_of_recipes
  end
end

