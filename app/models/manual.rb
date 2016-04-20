class Manual < ActiveRecord::Base
  serialize :data, JSON
end
