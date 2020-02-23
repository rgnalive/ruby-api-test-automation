Dado("o endpoint da API para listar users") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu listar users sem especificar nenhum parâmetro") do
  $response = @users_endpoint.listUsers("")
end

Então("eu recebo os users existentes na primeira página com um limite de {int} users por página") do |int|
  expect($response["page"]).to eq(1)
  expect($response["per_page"]).to eq(6)
  expect($response["total"]).to eq(12)
  expect($response["data"].length).to eq(6)

  # Com validação de banco de dados:
  # $query = @users_table.getUsersPage(1, 6)
  # for i in 0..($response["data"].length) do
  #   expect($response["data"][i]["email"]).to eq($query["rows"][i]["email"])
  #   expect($response["data"][i]["first_name"]).to eq($query["rows"][i]["first_name"])
  #   expect($response["data"][i]["last_name"]).to eq($query["rows"][i]["last_name"])
  #   expect($response["data"][i]["avatar"]).to eq($query["rows"][i]["avatar"])
  # end
end

Quando("eu listar users passando o parâmetro page igual a {int}") do |int|
  options = { page: 2 }
  $response = @users_endpoint.listUsers(options)
end

Então("eu recebo os users existentes na segunda página com um limite de {int} users por página") do |int|
  expect($response["page"]).to eq(2)
  expect($response["per_page"]).to eq(6)
  expect($response["total"]).to eq(12)
  expect($response["data"].length).to eq(6)

  # Com validação de banco de dados:
  # $query = @users_table.getUsersPage(2, 6)
  # for i in 0..($response["data"].length) do
  #   expect($response["data"][i]["email"]).to eq($query["rows"][i]["email"])
  #   expect($response["data"][i]["first_name"]).to eq($query["rows"][i]["first_name"])
  #   expect($response["data"][i]["last_name"]).to eq($query["rows"][i]["last_name"])
  #   expect($response["data"][i]["avatar"]).to eq($query["rows"][i]["avatar"])
  # end
end

Quando("eu listar users passando o parâmetro delay igual a {int}") do |int|
  start = Time.now

  options = { delay: int }
  $response = @users_endpoint.listUsers(options)

  $response_time = Time.now - start
end

Então("eu recebo os users existentes depois de {int} segundos") do |int|
  expect($response["page"]).to eq(1)
  expect($response["per_page"]).to eq(6)
  expect($response["total"]).to eq(12)
  expect($response["data"].length).to eq(6)
  
  expect($response_time).to be >= 3
end