class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth)
    user = where(auth.slice(:provider, :uid))

    if user.first
      return user
    else
      user = User.new(provider: auth.provider,
               uid: auth.uid,
               email: auth.info.email,
               password: Devise.friendly_token[0,20],
               name: auth.info.name)
      user.skip_confirmation!
      user.save
      return user
    end
  end
end
