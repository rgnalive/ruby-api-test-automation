class UsersEndpoint
  include HTTParty
  $base_uri = "#{ENV["base_uri"]}/users"

  # Obs: these ReqRes endpoints don't have any security auth. We know it's unsafe...

  def createUser(params)
    self.class.post($base_uri, :body => params)
  end

  def updateUser(params)
  end

  def deleteUser(params)
  end

  def findUsers(params)
  end

  def getUser(params)
  end
end
