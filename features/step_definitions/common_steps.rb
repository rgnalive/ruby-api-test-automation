Então("recebo o status {int}") do |int|                                                 
    expect($response.code).to eq(int)           
end