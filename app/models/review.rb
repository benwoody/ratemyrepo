class Review < ActiveRecord::Base
  attr_accessible :repo_id, :user_id, :rating, :comment, :current
  belongs_to :user
  belongs_to :repo

  validates_presence_of :rating
  validates :rating, inclusion: 1..5

  def self.update_and_create review, user
    if Review.where(repo_id: review[:repo_id],user_id: user).exists?
      old = Review.where(repo_id: review[:repo_id],
                         user_id: user).last
      old.current = false
      old.save!

      rev = Review.new review
      rev.user_id = user.id
      rev
    else
      rev = Review.new review
      rev.user_id = user.id
      rev
    end
  end

end
