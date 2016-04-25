module ParserEngine
  class Manual < ActiveRecord::Base
    serialize :data, JSON
  end
end
