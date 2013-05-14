module ReviewsHelper

  def review_notes
    if @reviewed
      {comment: @old_review[:comment],
       rating: @old_review[:rating]}
    else
      {comment: "", rating: ""}
    end
  end

end
