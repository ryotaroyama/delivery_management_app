# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    # def twitter
    # end

    # More info at:
    # https://github.com/heartcombo/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end

    def line
      @omniauth = request.env['omniauth.auth']
      if ENV['PRIVATE_UIDS'] == '*' || @omniauth['uid'].in?(ENV['PRIVATE_UIDS'].split(','))
        @profile = User.find_or_create_by!(uid: @omniauth['uid']) do |user|
          user.name = @omniauth['info']['name']
        end
        @profile.provider = @omniauth[:provider]
        @profile.set_values(@omniauth)

        sign_in(:user, @profile)
        redirect_to root_path
      else
        flash[:alert] = 'ログイン処理を実行できません。システム運営者にお尋ね下さい。'
        redirect_to new_user_session_path
      end
    end
  end
end
