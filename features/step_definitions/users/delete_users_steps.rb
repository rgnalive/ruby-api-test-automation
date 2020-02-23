Dado("o endpoint da API para excluir users") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu requisitar a exclusão de user informando um id existente") do
  # Poderia ser feita uma consulta na base de dados de users para conseguir um ID válido. No caso não possuímos acesso à base
  # A consulta poderia ser:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.deleteUser($query["id"])

  $response = @users_endpoint.deleteUser("1")
end

Então("as informações do user foram removidas da base de dados") do
   # Segue abaixo como seria a validação de banco de dados

  # $query = @users_table.getUserById($query["id"])
  # expect($query.length).to eq(0)
end

Quando("eu requisitar a exclusão de user informando um id inexistente") do
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.deleteUser($query["id"] + 1)

  $response = @users_endpoint.deleteUser("99")
end
