class ApplicationController < ActionController::Base
  protect_from_forgery

private
  helper_method :access_token
  def access_token
    current_user.try(:get_token)
  end
end
