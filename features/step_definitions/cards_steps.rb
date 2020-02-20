Dado("o endpoint da API para consultar Cards") do
  @cards_endpoint = CardsEndpoint.new
end

Quando("eu realizar um get no endpoint cards sem parâmetros") do
  $response = @cards_endpoint.getCards({})
end

Então("devo visualizar no máximo {int} Cards por página no retorno") do |int|
  expect($response["cards"].length).to eq(int)
end

Então("devo receber o status_code {int}") do |int|
  expect($response.code).to eq(int)
  expect($response.message).to eq("OK ")
end

Quando("eu realizar um get no endpoint cards buscando pelo name {string}") do |string|
  $response = @cards_endpoint.getCards({ name: string })
end

Então("devo visualizar somente Cards com o name {string}") do |string|
  for i in 0..$response["cards"].length - 1
    expect($response["cards"][i]["name"]).to match(/#{Regexp.escape(string)}|#{Regexp.escape(string.capitalize)}/)
  end
end

Quando("eu realizar um get no endpoint cards buscando pelos names {string} e {string} separados por vírgula") do |string, string2|
  $response = @cards_endpoint.getCards( "name=#{string}|#{string2}" )
  puts $response.request.last_uri.to_s
end

Então("devo visualizar somente Cards que possuam os names {string} ou {string}") do |string, string2|
  for i in 0..$response["cards"].length - 1
    puts $response["cards"][i]["name"]
    expect($response["cards"][i]["name"]).to match(/#{Regexp.escape(string)}|#{Regexp.escape(string.capitalize)}|#{Regexp.escape(string2)}|#{Regexp.escape(string2.capitalize)}/)
  end
end

# Quando("eu realizar um get no endpoint cards buscando por dois names separados por pipeline") do
# end

# Então("devo visualizar somente Cards com o primeiro name ou com o segundo name") do
# end
