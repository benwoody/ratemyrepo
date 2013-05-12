class ReviewsController < ApplicationController
  before_filter :find_repo, only: [:update_old,:create]
  before_filter :update_old, only: :create

  def create
    @review = Review.create(params[:review])
    @review.user_id = current_user.id

    if @review.save
      render :partial => 'reviews/show',
             :locals  => { :review => @review },
             :layout  => false,
             :status  => :created
    else
      render :js => "alert('Review not added')"
    end
  end

  def destroy
  end

  private

    def find_repo
      @repo = Repo.find(params[:review][:repo_id])
    end

    def update_old
      if !@repo.reviews.where(user_id: current_user).empty?
        old_review = @repo.reviews.where(user_id: current_user.id).last
        old_review.current = false
        old_review.save!
      end
    end
end
