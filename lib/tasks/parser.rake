task :parse, [:page_url] => :environment do |t, args|

  require 'open-uri'
  require 'nokogiri'

  doc = Nokogiri::HTML(open(args[:page_url]))

  data = { 
    brand: 'Whirlpool', 
    part_number: doc.css('.product-part-number').text, 
    title: doc.css('.product-title').text
  }

  doc.css('.pdf_manual').each_with_index do |el, index|
    result = {
      pdf_url: el.attr('href'),
      page_url: args[:page_url],
      data: data.merge(manual_item: doc.css('.manual_item h3')[index].text)}
    Manual.create!(result)
    puts(result) 
  end
end
