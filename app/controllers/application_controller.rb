class ApplicationController < ActionController::Base
  protect_from_forgery

private
  helper_method :current_user
  def current_user
    @curent_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token].present?
  end

  helper_method :access_token
  def access_token
    current_user.try(:get_token)
  end

  def check_user
    if current_user.blank?
      redirect_to login_url, notice: "Please log in or sign up to access the page."
    end
  end
end
