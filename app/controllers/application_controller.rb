class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
# , if: -> { Rails.env.production? && ENV['HEROKU_ENV'] != 'staging' }
