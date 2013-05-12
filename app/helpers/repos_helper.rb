module ReposHelper

  def current_user_owns review
    if current_user == review.user
      true
    else
      false
    end
  end

end
