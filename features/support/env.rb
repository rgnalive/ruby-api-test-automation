require "cucumber"
require "httparty"

#Environment
case ENV["env"]
when "stage"
  puts "Iniciando execução em ambiente de STAGE"
  ENV["base_uri"] = "https://reqres.in/"
when "dev"
  puts "Iniciando execução em ambiente de DEV"
else "local"
  puts "Iniciando execução em ambiente default: STAGE"
  ENV["base_uri"] = "https://reqres.in/"
end
