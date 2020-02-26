Dado("o endpoint da API para buscar um user específico") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu buscar um user por id existente") do
  $response_get_user = @users_endpoint.getUser("2")

  puts "users #{$response_get_user.request.uri}"

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response_get_user = @users_endpoint.getUser($query[rows][0]["id"])
end

Então("eu recebo informações apenas no user com o id especificado") do
  expect($response_get_user["data"]["id"]).to be_truthy
  expect($response_get_user["data"]["email"]).to eq("janet.weaver@reqres.in")
  expect($response_get_user["data"]["first_name"]).to eq("Janet")
  expect($response_get_user["data"]["last_name"]).to eq("Weaver")
  expect($response_get_user["data"]["avatar"]).to eq("https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg")

  # Com validação de banco de dados:
  # expect($response_get_user["data"]["email"]).to eq($query[rows][0]["email"])
  # expect($response_get_user["data"]["first_name"]).to eq($query[rows][0]["first_name"])
  # expect($response_get_user["data"]["last_name"]).to eq($query[rows][0]["last_name"])
  # expect($response_get_user["data"]["avatar"]).to eq($query[rows][0]["avatar"])
end

Quando("eu buscar um user por id inexistente") do
  $response_get_user = @users_endpoint.getUser("99")

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response_get_user = @users_endpoint.getUser($query[rows][0]["id"] + 1)
end
