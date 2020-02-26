require "cucumber"
require "httparty"
require "faker"
require "date"

# Condicionais de ambiente
case ENV["env"]

when "stage"
  puts "Beginning automation test in Stage's environment"
  ENV["api_url"] = "https://reqres.in/api"
  # Aqui também poderia ter token de autorização específico de cada ambiente, usuário e senha, etc...
when "dev"
  puts "Beginning automation test in Developer's environment"
else
  puts "Beginning automation test in default's environment: Stage"
  ENV["api_url"] = "https://reqres.in/api"
end
