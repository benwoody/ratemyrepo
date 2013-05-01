class ReposController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @repo = @user.repos.find_by_name(params[:repo])
    @comments = @repo.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@repo, current_user, "")
  end
end
