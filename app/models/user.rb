class User < ActiveRecord::Base
  attr_accessible :bio, :email, :fullname, :username, :github

  def self.create_with_github_auth(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
        user.username = auth['info']['nickname']
        user.fullname = auth['info']['name']
        user.email    = auth['info']['email']
        user.bio      = auth['info']['bio']
      end
    end
  end

  def github
    username
  end

end
