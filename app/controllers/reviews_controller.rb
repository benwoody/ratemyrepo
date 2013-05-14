class ReviewsController < ApplicationController

  def create
    @review = Review.update_and_create(params[:review], current_user)
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

end
