class LoginEndpoint
  include HTTParty
  $base_uri = "#{ENV["api_url"]}/login"

  def login(body)
    self.class.post($base_uri, :body => body)
  end
end
