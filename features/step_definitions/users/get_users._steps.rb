Dado("o endpoint da API para buscar um user específico") do
  @users_endpoint = UsersEndpoint.new
end
  
Quando("eu buscar um user por id existente") do
  $response = @users_endpoint.getUser("2")

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.getUser($query[rows][0]["id"])
end

Então("eu recebo informações apenas no user com o id especificado") do
  expect($response["data"]["id"]).to be_truthy
  expect($response["data"]["email"]).to eq("janet.weaver@reqres.in")
  expect($response["data"]["first_name"]).to eq("Janet")
  expect($response["data"]["last_name"]).to eq("Weaver")
  expect($response["data"]["avatar"]).to eq("https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg")

  # Com validação de banco de dados:
  # expect($response["data"]["email"]).to eq($query[rows][0]["email"])
  # expect($response["data"]["first_name"]).to eq($query[rows][0]["first_name"])
  # expect($response["data"]["last_name"]).to eq($query[rows][0]["last_name"])
  # expect($response["data"]["avatar"]).to eq($query[rows][0]["avatar"])
end

Quando("eu buscar um user por id inexistente") do
  $response = @users_endpoint.getUser("99")

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.getUser($query[rows][0]["id"] + 1)
end

Então("eu recebo uma lista vazia") do
  expect($response.length).to eq(0)
end