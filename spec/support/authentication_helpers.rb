module AuthenticationHelpers

  def logged_in?
    page.has_selector? "a", :text => "Sign out"
  end

  def login_with(provider, mock_options = {})
    if mock_options == :invalid_credentials
      OmniAuth.config.mock_auth[provider] = :invalid_credentials
    else
      OmniAuth.config.add_mock provider, mock_options
    end
    visit "/auth/#{provider}"
  end

  def user_info
    {
      'provider' => 'github',
      'uid'      => '123456',
      'info'     => {
        'email'    => 'test@example.com',
        'name'     => 'Test McTesterson',
        'urls'     => {'Blog' => 'http://example.com'},
      },
      'extra'    => {
        'raw_info' => {
          'gravatar_id' => 'my_gravatar_thingy',
          'location'    => 'Seattle, Wa',
          'login'       => 'McAwesome',
          'bio'         => 'I Rule!'
        }
      }
    }
  end

end
