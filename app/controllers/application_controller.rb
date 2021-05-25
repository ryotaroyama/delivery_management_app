class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: -> { Rails.env.production? }
end
