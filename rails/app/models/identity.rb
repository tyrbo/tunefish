class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(hash)
    @identity = find_by_provider_and_uid(hash['provider'], hash['uid'].to_s)
    unless @identity == nil
      @identity.update(token: hash['credentials']['token'])
    end
    @identity
  end

  def self.create_from_hash(hash, user = nil )
    user ||= User.create_from_hash!(hash)
    Identity.create(:user => user, :uid => hash['uid'], :provider => hash['provider'], :token => hash['credentials']['refresh_token'])
  end
end
