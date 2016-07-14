class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  TEMP_EMAIL= "change_me@example.com"

  def self.find_or_create_from_auth(auth)
    self.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
			user.uid   = auth.uid
			user.name  = auth.info.name
                        user.password =  Devise.friendly_token[0,20]
			user.email = auth.info.email || TEMP_EMAIL
			user.image = auth.info.image
			user.nick_name= auth.info.nickname if auth.info.nickname
			user.oauth_token      = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
    end
   
  end

  def need_more_info? 
      email == TEMP_EMAIL ||  nick_name.nil?
  end
end
