module ApplicationHelper

   def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "RateMyRepo").join(" @ ")
      end
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=128"
  end

end
