class SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.authenticate(params[:email], params[:password])
    token = if user && user.activated?
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      user.get_token
    end

    if user && !user.activated?
      msg = "Your account has not been activated yet. Please contact <a href='mailto:info@ranktrackr.com'>info@ranktrackr.com</a>"
      respond_with({ error: msg }, location: nil, status: 401)
    else
      respond_with({ access_token: token }, location: nil, status: token.present?? 201 : 401)
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
    # TODO: revoke token?
  end
end
