Dado("o endpoint da API para buscar um unknown específico") do
  @unknowns_endpoint = UnknownsEndpoint.new
end

Quando("eu buscar um unknown por id existente") do
  $response_get_unknown = @unknowns_endpoint.getUnknown("2")

  # Com consulta na base de dados:
  # @unknowns_table = UnknownsTable.new
  # $query = @unknowns_table.getLastUnknown()
  # $response_get_unknown = @unknowns_endpoint.getUnknown($query[rows][0]["id"])
end

Então("eu recebo informações apenas do unknown com o id especificado") do
  expect($response_get_unknown["data"]["id"]).to be_truthy
  expect($response_get_unknown["data"]).to eq("fuchsia rose")
  expect($response_get_unknown["data"]["year"]).to eq("2001")
  expect($response_get_unknown["data"]["color"]).to eq("#C74375")
  expect($response_get_unknown["data"]["pantone_value"]).to eq("17-2031")

  # Com validação de banco de dados:
  # expect($response_get_unknown["data"]["name"]).to eq($query[rows][0]["name"])
  # expect($response_get_unknown["data"]["year"]).to eq($query[rows][0]["year"])
  # expect($response_get_unknown["data"]["color"]).to eq($query[rows][0]["color"])
  # expect($response_get_unknown["data"]["pantone_value"]).to eq($query[rows][0]["pantone_value"])
end

Quando("eu buscar um unknown por id inexistente") do
  $response_get_unknown = @unknowns_endpoint.getUnknown("99")

  # Com consulta na base de dados:
  # @unknowns_table = UnknownsTable.new
  # $query = @unknowns_table.getLastUnknown()
  # $response_get_unknown = @unknowns_endpoint.getUnknown($query[rows][0]["id"] + 1)
end
