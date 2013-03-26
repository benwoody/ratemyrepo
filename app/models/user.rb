class User < ActiveRecord::Base
  attr_accessible :bio, :email, :fullname, :uid, :username
end
