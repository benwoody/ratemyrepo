class ReposController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @repo = Repo.find_by_name(params[:repo])
  end
end
