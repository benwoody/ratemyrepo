class Repo < ActiveRecord::Base

  belongs_to :user

  attr_accessible :description, :fork, :name, :url

  validates :name, :presence   => true,
                   :uniqueness => true

  def to_param
    name
  end

end
