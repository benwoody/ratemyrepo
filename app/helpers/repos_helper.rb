module ReposHelper

  def current_user_owns comment
    if current_user == comment.user
      true
    else
      false
    end
  end

end
