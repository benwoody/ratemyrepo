class Review < ActiveRecord::Base
  attr_accessible :repo_id, :user_id
  belongs_to :user
  belongs_to :repo

  validates_presence_of :rating
  validates :rating, inclusion: 1..5
end
