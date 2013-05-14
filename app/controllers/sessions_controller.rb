class SessionsController < ApplicationController

  def new
    store_location
    redirect_to '/auth/github'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.where(:uid => auth_hash['uid']).first ||
           User.create_with_github_auth(auth_hash)
    session[:user_id] = user.id
    redirect_back_or root_url
    flash[:notice] = "Signed in"
  end

  def failure
    redirect_back_or root_url
    flash[:alert] = "Authentication Failed"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out"
  end

end
