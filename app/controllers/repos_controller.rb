class ReposController < ApplicationController
  before_filter :reviewed

  def show
    @user = User.find_by_username(params[:username])
    @repo = @user.repos.find_by_name(params[:repo])
    @reviews = @repo.reviews.order('created_at desc')
  end

  private

    def reviewed
      user = User.find_by_username(params[:username])
      repo = user.repos.find_by_name(params[:repo])
      if repo.reviews.where(user_id: current_user).empty?
        @new_review = Review.new
      else
        @new_review = Review.new
        @old_review = repo.reviews.where(user_id: current_user).last
      end
    end
end
