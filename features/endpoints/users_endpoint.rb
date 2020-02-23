class UsersEndpoint
  include HTTParty
  $base_uri = "#{ENV["base_uri"]}/users"

  def createUser(body)
    self.class.post($base_uri, :body => body)
  end

  def updateUser(user_id, body)
    self.class.put("#{$base_uri}/#{user_id}", :body => body)
  end

  def deleteUser(user_id)
    self.class.delete("#{$base_uri}/#{user_id}")
  end

  def getUser(user_id)
    self.class.get("#{$base_uri}/#{user_id}")
  end

  def listUsers(query)
    self.class.get($base_uri, :query => query)
  end
end
