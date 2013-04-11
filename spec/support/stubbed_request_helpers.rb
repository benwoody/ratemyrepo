module RequestHelpers

  def stub_single_repo
    ret = File.open("#{Rails.root}/spec/support/github_repo_return.json")
    stub_request(:get, "https://api.github.com/repos/mcawesome/brewerydb2").
           with(:headers => {'Content-Type'=>'application/json', 'User-Agent'=>'Github Ruby Gem 0.9.4'}).
           to_return(:status => 200, :body => "", :headers => {})
  end

  def stub_list_of_repos
      ret = File.open("#{Rails.root}/spec/support/github_list_return.json")
      stub_request(:get, "https://api.github.com/users/mcawesome/repos").
           with(:headers => {'Content-Type'=>'application/json', 'User-Agent'=>'Github Ruby Gem 0.9.4'}).
           to_return(:status => 200, :body => ret, :headers => {})
  end

end
