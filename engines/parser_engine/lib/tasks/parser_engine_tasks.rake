task :parse => :environment do
  ParserEngine::CategoriesJob.perform_later('http://www.whirlpool.com/home-appliances/')
end
