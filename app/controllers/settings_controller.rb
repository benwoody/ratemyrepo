class SettingsController < ApplicationController
  helper SessionsHelper

  before_filter :current_user
  before_filter :authenticate
  before_filter :find_user, :except => [:update_user]

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
    @repo = @user.repos.build
    @current_repos = @user.repos

    @repo_names ||= []
    current_user.github_repos.each do |repo|
      @repo_names << repo.name unless @current_repos.map { |r| r['name'] }.include?(repo.name)
    end
  end

  def add_repo
    @repo = Repo.scrape_github(@user, params[:repo][:name])
    # if @repo.exist?
      redirect_to repo_path(@user,@repo), notice: "Repo added"
    # else
    #   render :action => 'repos'
    # end
  end

  private

    def find_user
      @user = current_user
    end

end
