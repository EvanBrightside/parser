require 'open-uri'

module ParserEngine
  class SubcategoriesJob < ActiveJob::Base

    def perform(page_url)
      doc = Nokogiri::HTML(open(page_url))

      doc.css('#_title').each do |elem|
        ParseJob.perform_later(elem.attr('href'))
      end
    end
  end
end
