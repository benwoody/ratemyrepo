class Repo < ActiveRecord::Base

  belongs_to :user

  attr_accessible :description, :fork, :name, :url

  def to_param
    name
  end

end
