class Feed < ActiveRecord::Base
  has_many :activities
end
