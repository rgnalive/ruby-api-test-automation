Dado("o endpoint da API para excluir users") do
  @users_endpoint = UsersEndpoint.new
end

Quando("eu requisitar a exclusão de user informando um id existente") do
  $response = @users_endpoint.deleteUser("1")

  # Com consulta na base de dados:
  # @users_table = UsersTable.new
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.deleteUser($query[rows][0]["id"])
end

Então("as informações do user foram removidas da base de dados") do
  # Com validação de banco de dados:
  # $query = @users_table.getUserById($query[rows][0]["id"])
  # expect($query.length).to eq(0)
end

Quando("eu requisitar a exclusão de user informando um id inexistente") do
  $response = @users_endpoint.deleteUser("99")

  # Com consulta na base de dados:
  # $query = @users_table.getLastUser()
  # $response = @users_endpoint.deleteUser($query[rows][0]["id"] + 1)
end
