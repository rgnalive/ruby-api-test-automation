class CardsEndpoint
  include HTTParty
  $base_uri = "#{ENV["base_uri"]}cards"

  def getCards(params)
    self.class.get($base_uri, query: params)
  end
end
