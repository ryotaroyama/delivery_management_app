class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: -> { Rails.env.production? && ENV['HEROKU_ENV'] != 'staging' }
end
# , if: -> { Rails.env.production? && ENV['HEROKU_ENV'] != 'staging' }
# ユーザーがログインしているかどうか確認する！before_action :authenticate_user!
