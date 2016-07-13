class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    self.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
			user.uid   = auth.uid
			user.name  = auth.info.name
			user.email = auth.info.email
			user.image = auth.info.image
			user.nick_name= auth.info.nickname if auth.info.nickname
			user.oauth_token      = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
    end

  end
end
