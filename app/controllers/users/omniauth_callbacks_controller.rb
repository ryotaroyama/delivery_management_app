# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def line
      @omniauth = request.env['omniauth.auth']
      if permit_uids?
        build_user
        sign_in(:user, @user)
        redirect_to root_path
      else
        flash[:alert] = 'ログイン処理を実行できません。システム運営者にお尋ね下さい。'
        redirect_to new_user_session_path
      end
    end

    private

    def permit_uids?
      ENV['PRIVATE_UIDS'] == '*' || @omniauth['uid'].in?(ENV['PRIVATE_UIDS'].split(','))
    end

    def build_user
      @user = User.find_or_create_by!(uid: @omniauth['uid']) do |user|
        user.name = @omniauth['info']['name']
      end
      @user.provider = @omniauth[:provider]
    end
  end
end
