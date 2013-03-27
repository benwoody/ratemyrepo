class Repo < ActiveRecord::Base

  belongs_to :user

  attr_accessible :description, :fork, :name, :url

end
