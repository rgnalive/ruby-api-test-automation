require "cucumber"
require "httparty"
require "faker"
require "date"





#Environment Conditional
case ENV["env"]

when "stage"
  puts "Beginning automation test in Stage's environment"
  ENV["base_uri"] = "https://reqres.in/api"

when "dev"
  puts "Beginning automation test in Developer's environment"

else 
  puts "Beginning automation test in default's environment: Stage"
  ENV["base_uri"] = "https://reqres.in/api"

end
