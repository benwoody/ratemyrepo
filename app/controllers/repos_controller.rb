class ReposController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @repo = @user.repos.find_by_name(params[:repo])
    @review = @repo.reviews.order('created_at desc')
    @new_review = Review.new
  end
end
