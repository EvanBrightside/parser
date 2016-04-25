require 'open-uri'

module ParserEngine
  class ParseJob < ActiveJob::Base

    def perform(page_url)
      page_url = page_url.gsub('[', '%5B').gsub(']', '%5D')

      doc = Nokogiri::HTML(open(page_url))

      data = { 
        brand: 'Whirlpool', 
        part_number: doc.css('.product-part-number').text, 
        title: doc.css('.product-title').text
      }

      doc.css('.pdf_manual').each_with_index do |el, index|
        Manual.create!(
          pdf_url: 'http://www.whirlpool.com' + el.attr('href'),
          page_url: page_url,
          data: data.merge(manual_item: doc.css('.manual_item h3')[index].text)
        )
      end
    end
  end
end
