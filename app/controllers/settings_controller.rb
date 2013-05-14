class SettingsController < ApplicationController
  helper SessionsHelper

  before_filter :current_user, except: [:update_user]
  before_filter :authenticate

  def show
  end

  def user
  end

  def update_user
    if current_user.update_attributes(params[:user])
      redirect_to settings_url, notice: "Updated settings"
    else
      redirect_to settings_url, alert: "Update failed"
    end
  end

  def repos
    @repo = current_user.repos.build
    @current_repos = current_user.repos

    @repo_names ||= []
    current_user.github_repos.each do |repo|
      @repo_names << repo.name unless @current_repos.map { |r| r['name'] }.include?(repo.name)
    end
  end

  def add_repo
    @repo = Repo.scrape_github(current_user, params[:repo][:name])
    redirect_to repo_path(current_user,@repo), notice: "Repo added"
  end

end
