require 'nokogiri'
require 'open-uri'
require 'pry'
# requiring the pokemon class to use 
require 'pokemon'
class Scraper 

URL = 'pokemon_index.html'

  def initialize(db)
    @db = db
    @html_scrape = Nokogiri::HTML(open(URL))
  end 

  def scrape
      @html_scrape.css('span.infocard-tall').each do |pokemon|
        name = pokemon.css('a.ent-name').text 
        type = pokemon.css('small.aside').text 
        # binding.pry
        type = type.gsub( " · ", ", ")
        sql = " INSERT INTO pokemon (name, type) VALUES (?, ?) "
        # @db.execute(sql, name, type)
        # insert(name, type)
        Pokemon.save(name, type, @db)
      end
  end

  # helper method  
  # def insert 
  # sql = " INSERT INTO pokemon (name, type) VALUES (?, ?) "
        # @db.execute(sql, name, type)
  # end
end


