class SettingsController < ApplicationController
  helper SessionsHelper

  before_filter :current_user
  before_filter :authenticate

  def index
  end

  def update
    if @current_user.update_attributes(params[:user])
      redirect_to settings_url, notice: "Updated settings"
    else
      redirect_to settings_url, alert: "Update failed"
    end
  end

end
