class ReposController < ApplicationController
  before_filter :reviewed

  def show
    @user = User.find_by_username(params[:username])
    @repo = @user.repos.find_by_name(params[:repo])
    @reviews = @repo.reviews.page.per(10).order('created_at desc').
                                          where(current: true)
  end

  private

    def reviewed
      user = User.find_by_username(params[:username])
      repo = user.repos.find_by_name(params[:repo])
      if repo.reviews.where(user_id: current_user).empty?
        @reviewed = false
        @new_review = Review.new
      else
        @reviewed = true
        @new_review = Review.new
        @old_review = repo.reviews.where(user_id: current_user).last
      end
    end

end
