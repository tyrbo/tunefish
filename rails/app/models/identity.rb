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

  def self.create_from_hash(auth_hash, user = nil)
    user ||= User.create_from_hash!(auth_hash)

    create do |identity|
      identity.user = user
      identity.uid = auth_hash['uid']
      identity.provider = auth_hash['provider']
      identity.token = auth_hash['credentials']['token']
      save_extra_provider_info(auth_hash, user)
    end
  end

  def self.save_extra_provider_info(auth_hash, user)
    if auth_hash['provider'] == 'soundcloud'
      user.update_attributes(soundcloud_user_id: auth_hash['extra']['raw_info']['id'])
    elsif auth_hash['provider'] == 'twitter'
      user.update_attributes(twitter_screen_name: auth_hash['info']['nickname'])
    end
  end
end
