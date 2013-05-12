class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review])
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
end
