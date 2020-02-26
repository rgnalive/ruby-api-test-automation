class UnknownsEndpoint
  include HTTParty
  $base_uri = "#{ENV["api_url"]}/unknown"

  puts $base_uri

  def getUnknown(unknown_id)
    self.class.get("#{$base_uri}/#{unknown_id}")
  end

  def listUnknown(query)
    self.class.get($base_uri, :query => query)
  end
end
