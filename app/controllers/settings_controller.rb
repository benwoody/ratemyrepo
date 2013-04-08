class SettingsController < ApplicationController
  helper SessionsHelper

  before_filter :current_user
  before_filter :authenticate

  def index
    @edit_user = current_user
    @repos = current_user.github_repos.each do |repo|
      repo.name
    end
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to settings_url, notice: "Updated settings"
    else
      redirect_to settings_url, alert: "Update failed"
    end
  end

end
