Dado("o endpoint da API para listar users") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu listar users sem especificar nenhum parâmetro") do
  $response = @users_endpoint.listUsers("")
end

Então("eu recebo os users existentes na página {int} com um limite de {int} users por página") do |int, int2|
  expect($response["page"]).to eq(int)
  expect($response["per_page"]).to eq(int2)
  expect($response["total"]).to eq(12)
  expect($response["data"].length).to eq(int2)

  # Com validação de banco de dados:
  # $query = @users_table.getUsersPage(int, int2)
  # for i in 0..($response["data"].length) do
  #   expect($response["data"][i]["email"]).to eq($query["rows"][i]["email"])
  #   expect($response["data"][i]["first_name"]).to eq($query["rows"][i]["first_name"])
  #   expect($response["data"][i]["last_name"]).to eq($query["rows"][i]["last_name"])
  #   expect($response["data"][i]["avatar"]).to eq($query["rows"][i]["avatar"])
  # end
end

Quando("eu listar users passando o parâmetro page igual a {int}") do |int|
  options = { page: int }
  $response = @users_endpoint.listUsers(options)
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
  
  expect($response_time).to be >= int
end