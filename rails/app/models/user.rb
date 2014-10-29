class User < ActiveRecord::Base
  has_many :identities

  def self.create_from_hash!(hash)
    create(:name => hash['info']['first_name'])
  end

  def google_identity
    self.identities.find_by(provider: 'google_oauth2')
  end

  def google_token
    google_identity.token
  end
end
