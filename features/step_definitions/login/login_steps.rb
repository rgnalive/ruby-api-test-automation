Dado("o endpoint da API para realizar login") do
  @login_endpoint = LoginEndpoint.new
end

Quando("eu requisito o login passando as informações corretas") do
  $payload = {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka",
  }

  $response_login = @login_endpoint.login($payload)
end

Então("eu recebo o token gerado") do
  expect(@response_login.token).to be_a(String)
end

Quando("eu requisito o login passando um email inválido") do
  $payload = {
    "email": "email_invalido@teste.com.br",
    "password": "cityslicka",
  }

  $response_login = @login_endpoint.login($payload)
end

Quando("eu requisito o login passando uma senha inválida") do
  $payload = {
    "email": "eve.holt@reqres.in",
    "password": "SENHAINVALIDA",
  }

  $response_login = @login_endpoint.login($payload)
end

Quando("eu requisito o login sem passar login") do
  $payload = {
    "password": "cityslicka",
  }

  $response_login = @login_endpoint.login($payload)
end

Quando("eu requisito o login sem passar senha") do
  $payload = {
    "email": "eve.holt@reqres.in",
  }

  $response_login = @login_endpoint.login($payload)
end
