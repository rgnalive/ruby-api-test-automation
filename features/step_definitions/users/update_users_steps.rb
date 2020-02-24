Dado("o endpoint da API para alterar users") do
  @users_endpoint = UsersEndpoint.new
end
  
Quando("eu requisitar a alteração de user informando um id existente") do
  $payload = {
    "name": Faker::Name.name,
    "job": Faker::Job.title,
  }

  $response = @users_endpoint.updateUser(2, $payload)

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.updateUser($query[rows][0]["id"], $payload)
end

Então("recebo os dados do user atualizados de volta com a data e hora de atualização") do
  $today = Date.today

  expect($response["name"]).to eq($payload[:name])
  expect($response["job"]).to eq($payload[:job])
  expect(($response["updatedAt"])[0..9]).to eq($today.to_s)
end

Então("as informações alteradas do user foram persistidas na base de dados") do
  # Com validação de banco de dados:
  # $query = @users_table.getUserById(2)
  # expect($query[rows][0]["name"])to eq($payload[:name])
  # expect($query[rows][0]["job"])to eq($payload[:name])
end

Quando("eu requisitar a alteração de user informando um id inexistente") do
  $payload = {
    "name": Faker::Name.name,
    "job": Faker::Job.title,
  }

  $response = @users_endpoint.updateUser(99, $payload)

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.updateUser($query[rows][0]["id"] + 1, $payload)
end