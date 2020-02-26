Dado("o endpoint da API para listar unknowns") do
  @unknowns_endpoint = UnknownsEndpoint.new
end

Quando("eu listar os unknowns sem especificar nenhum parâmetro") do
  $response_list_unknown = @unknowns_endpoint.listUnknown("")
end

Então("eu recebo os unknowns existentes na página {int} com um limite de {int} unknowns por página") do |int, int2|
  expect($response_list_unknown["page"]).to eq(int)
  expect($response_list_unknown["per_page"]).to eq(int2)
  expect($response_list_unknown["total"]).to eq(12)
  expect($response_list_unknown["data"].length).to eq(int2)

  # Com validação de banco de dados:
  # $query = @unknowns_table.getUnknownsPage(int, int2)
  # for i in 0..($response_list_unknown["data"].length) do
  #   expect($response_list_unknown["data"][i]["name"]).to eq($query["rows"][i]["name"])
  #   expect($response_list_unknown["data"][i]["year"]).to eq($query["rows"][i]["year"])
  #   expect($response_list_unknown["data"][i]["color"]).to eq($query["rows"][i]["color"])
  #   expect($response_list_unknown["data"][i]["pantone_value"]).to eq($query["rows"][i]["pantone_value"])
  # end
end

Quando("eu listar os unknowns passando o parâmetro page igual a {int}") do |int|
  options = { page: int }
  $response_list_unknown = @unknowns_endpoint.listUnknown(options)
end
