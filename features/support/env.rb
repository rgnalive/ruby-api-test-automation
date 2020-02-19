require "cucumber"
require "httparty"

#Configurações de ambiente
case ENV["env"]
when "uat"
  puts "Iniciando execução em ambiente de UAT"
  ENV["base_uri"] = "http://api.magicthegathering.io/v1/"
when "dev"
  puts "Iniciando execução em ambiente de DEV"
else "local"
puts "Iniciando execução em ambiente LOCAL"
end
