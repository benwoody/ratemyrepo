module SessionsHelper

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  def signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, alert: "Access denied"
    end
  end

  def authenticate
    if !current_user
      redirect_back_or root_url
      flash[:alert] = 'You need to sign in to access this page'
    else
      true
    end
  end

  private

    def store_location
      session[:return_to] = request.referrer
    end

    def clear_return_to
      session[:return_to] = nil
    end

end
