class ReposController < ApplicationController
  def show
    @repo = Repo.find_by_name(params[:repo])
  end
end
