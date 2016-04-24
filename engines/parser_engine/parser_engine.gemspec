$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "parser_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "parser_engine"
  s.version     = ParserEngine::VERSION
  s.authors     = ["Ivan Zabrodin"]
  s.email       = ["xvanx84@gmail.com"]
  s.homepage    = "https://github.com/EvanBrightside"
  s.summary     = "Summary of ParserEngine."
  s.description = "Description of ParserEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_dependency "sidekiq"

  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
end
