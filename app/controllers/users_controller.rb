class UsersController < ApplicationController
  before_filter :authorize_github

  def show
    @user = User.find_by_username(params[:username])
    @repos = Repo.where(:user_id => @user.id).all
  end

  private

    def authorize_github
      @github = Github.new(:client_id => GITHUB['client_id'],
                         :client_secret => GITHUB['client_secret'])
    end
end
