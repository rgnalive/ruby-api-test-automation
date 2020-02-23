Dado("o endpoint da API para cadastrar users") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu requisitar o cadastro de user") do
  $payload = {
    "name": Faker::Name.name,
    "job": Faker::Job.title,
  }

  $response = @users_endpoint.createUser($payload)
end

Então("eu recebo os dados do user de volta com o id gerado e data e hora da criação") do
  $today = Date.today

  expect($response["name"]).to eq($payload[:name])
  expect($response["job"]).to eq($payload[:job])
  expect($response["id"]).to be_truthy
  expect(($response["createdAt"])[0..9]).to eq($today.to_s)
end

Então("as informações cadastradas do user foram persistidas na base de dados") do
  # Infelizmente não possuo acesso à base de dados da API ReqRes
  # Mas, para simularmos uma validação de banco de dados, usamos o código comentado abaixo (Ele não funcionará se descomentar)

  # @users_table = UsersTable.new

  # $query = @users_table.getUserById($response["id"])
  # expect($query["name"])to eq($payload[:name])
  # expect($query["job"])to eq($payload[:name])
end

Quando("eu requisitar o cadastro de user com um name já existente") do
  $payload = {
    "name": Faker::Name.name,
    "job": Faker::Job.title,
  }

  @users_endpoint.createUser($payload)
  $response = @users_endpoint.createUser($payload)
end

Então("eu recebo a mensagem User already exists.") do
  expect($response["message"]).to eq("User already exists.")
end
