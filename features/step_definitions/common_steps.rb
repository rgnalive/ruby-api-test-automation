Então("recebo o status {int}") do |int|
  expect($response.code).to eq(int)
end

Então("eu recebo uma lista vazia") do
  expect($response.length).to eq(0)
end

Então("eu recebo o erro {string}") do |string|
  expect($response["error"]).to eq(string)
end
