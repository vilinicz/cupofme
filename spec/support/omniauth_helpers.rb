module OmniauthHelpers
  OmniAuth.config.test_mode = true

  PROVIDER_PROFILE_UIDS = ['qY7HURhcI2', '7911119', '14458227'].freeze

  def load_omniauth_mock(data = {})
    @omniauth_file ||= File.open(File.expand_path('../../fixtures/omniauth.yml', __FILE__)).read
    yml = @omniauth_file.gsub(/{(.*)}/) {data[$1] || ''}
    @omniauth_mocks = YAML.load(yml)
  end

  def mock_omniauth(provider, options = {})
    @oauth_data = @omniauth_mocks[provider.to_s]
    OmniAuth.config.mock_auth[provider.to_sym] = oauth_data
  end

  def user_data(options = {})
    unless options[:user].is_a?(User)
      attrs = options[:attrs] && options[:attrs].symbolize_keys || {}
      options[:user] = FactoryGirl.attributes_for(:user).symbolize_keys.merge(attrs)
    end
    Hashie::Mash.new({
      uid: PROVIDER_PROFILE_UIDS.sample,
      username: options[:user][:username],
      email: options[:user][:email],
      first_name: 'Joe',
      last_name: 'Johnston',
      name: 'Joe Johnston',
      location: 'San Francisco, CA USA',
      image_url: 'http://graph.facebook.com/534166665/picture?type=square',
      bio: 'I live in SF and like to turn ideas into reality.',
      website: 'http://joejohnston.me',
      nickname: 'simple10',
      verified: true
    })
  end
end