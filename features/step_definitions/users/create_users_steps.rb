Dado("o endpoint da API para cadastrar users") do                                       
    @users_endpoint = UsersEndpoint.new
end                                                                                     
                                                                                        
Quando("eu requisitar o cadastro de user") do                                           
    $payload = {
        "name": Faker::Name.name,
        "job": Faker::Job.title
    }

    $response = @users_endpoint.createUser($payload)        
end                                                                                     
                                                                                        
Então("eu recebo os dados do user de volta com o id gerado e data e hora da criação") do
    $today = Date.today

    expect($response["name"]).to eq($payload[:name])
    expect($response["job"]).to eq($payload[:job])
    expect($response["id"]).to be_truthy
    expect(($response["createdAt"])[0..9]).to eq($today.to_s)
end                                                                                     
                                                                                        
Então("as informações cadastradas do user foram persistidas na base de dados") do       
    # Unfortunelly, I don't have access to ReqRes API database, but i can put a smile instead:
    puts "This is a smile: =)"

    # WAIT!!! Read this before you go:
    # If I must assert the DB information, I have to compare the "$payload" JSON I used in the request with a select from Users table (Let's pretend that is "Users", ok?): 

    # @users_table = UsersTable.new

    # $query = @users_table.getUserById($response["id"])
    # expect($query["name"])to eq($payload[:name])
    # expect($query["job"])to eq($payload[:name])
end