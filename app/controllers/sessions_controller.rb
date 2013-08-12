class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if (User.find_by_provider_and_uid(auth["provider"], auth["uid"]))
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    else
      user = User.create_with_omniauth(auth)
    end
    session[:user_id] = user.id
    redirect_to servers_url, :notice => "Welcome!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to servers_url, :notice => "Log out successfully!"
  end

  def failure
    redirect_to signin_signin_url, :notice => "Authentication failed, please try again."
  end
end


