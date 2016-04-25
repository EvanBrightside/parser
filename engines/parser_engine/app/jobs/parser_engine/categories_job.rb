require 'open-uri'

module ParserEngine
  class CategoriesJob < ActiveJob::Base

    def perform(page_url)
      doc = Nokogiri::HTML(open(page_url))
      
      SubcategoriesJob.perform_later('http://www.whirlpool.com' + doc.css('.grabWashers').attr('href'))
      SubcategoriesJob.perform_later('http://www.whirlpool.com' + doc.css('.grabDryers').attr('href'))
      SubcategoriesJob.perform_later('http://www.whirlpool.com' + doc.css('#nav-home-solutions .tier3Column ul li')[2].css('a').attr('href'))
      SubcategoriesJob.perform_later('http://www.whirlpool.com' + doc.css('#nav-home-solutions .tier3Column ul li')[3].css('a').attr('href'))
    end
  end
end
