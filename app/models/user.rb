class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # :registerable, :recoverable, :rememberable, :validatable,
  devise :database_authenticatable, :omniauthable, omniauth_providers: %i[line]

  attr_accessor :provider

  def social_profile(provider)
    social_profiles.find { |sp| sp.provider == provider.to_s }
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']

    # credentials = omniauth['credentials']
    # info = omniauth['info']

    # access_token = credentials['refresh_token']
    # access_secret = credentials['secret']
    # credentials = credentials.to_json
    # name = info['name']
    # set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  # def set_values_by_raw_info(raw_info)
  #   self.raw_info = raw_info.to_json
  #   save!
  # end

  def encrypted_password; end
end
