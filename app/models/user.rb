class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # :registerable, :recoverable, :rememberable, :validatable,
  devise :database_authenticatable, :omniauthable, omniauth_providers: %i[line]

  # Devise のエラーを回避
  attr_accessor :provider

  def encrypted_password; end
end
