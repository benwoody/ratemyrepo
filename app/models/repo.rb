class Repo < ActiveRecord::Base

  belongs_to :user
  has_many :reviews

  attr_accessible :description, :fork, :name, :url

  validates :name, :presence   => true,
                   :uniqueness => true

  def to_param
    name
  end

  def self.scrape_github(user,repo)
    github = Github::Repos.new(user: user.username, repo: repo).get.body
    create! do |r|
      r.user_id     = user.id
      r.name        = repo
      r.description = github['description']
      r.url         = github['html_url']
      r.fork        = github['fork']
    end
  end

end
