class RepoController < ApplicationController
  before_filter :authorize_github

  def index

  end

  private

    def authorize_github
      auth = YAML.load(File.read(Rails.root.join('config', 'github.yml')))[Rails.env]
      @github = Github.new(:client_id => auth['client_id'],
                         :client_secret => auth['client_secret'])
    end
end

