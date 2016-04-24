task :parse => :environment do
  CategoriesJob.perform_later('http://www.whirlpool.com/home-appliances/')
end
