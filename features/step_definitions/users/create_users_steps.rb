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
  # Com validação de banco de dados:
  # $query = @users_table.getUserById($response["id"])
  # expect($query[rows][0]["name"])to eq($payload[:name])
  # expect($query[rows][0]["job"])to eq($payload[:name])
end

Quando("eu requisitar o cadastro de user com um name já existente") do
  puts "A API validada não possui essa feature. Criei o teste apenas para simular"
  # $payload = {
  #   "name": Faker::Name.name,
  #   "job": Faker::Job.title,
  # }

  # @users_endpoint.createUser($payload)
  # $response = @users_endpoint.createUser($payload)
end

Então("eu recebo a mensagem User already exists.") do
  puts "A API validada não possui essa feature. Criei o teste apenas para simular"
  # expect($response["message"]).to eq("User already exists.")
end
