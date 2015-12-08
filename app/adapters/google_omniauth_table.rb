class GoogleOmniauthTable < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.user_id  = user.id
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end

  end
end
