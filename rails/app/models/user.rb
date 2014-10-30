class User < ActiveRecord::Base
  has_many :identities

  def self.create_from_hash!(hash)
    binding.pry
    create(:name => hash['info']['name'])
  end
end
