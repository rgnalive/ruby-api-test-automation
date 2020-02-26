# language: pt

@login
Funcionalidade: User Login
    Como um usuário do sistema
    Eu quero poder me logar
    A fim de utilizar o sistema

@success
Cenário: Realizar login com sucesso
    Dado o endpoint da API para realizar login
    Quando eu requisito o login passando as informações corretas
    Então eu recebo o token gerado
    E recebo o status 200

@error @notrun
Cenário: Erro ao tentar logar com email inválido
    Dado o endpoint da API para realizar login
    Quando eu requisito o login passando um email inválido
    Então eu recebo  o erro "User not found"
    E recebo o status 404

@error @notrun
Cenário: Erro ao tentar logar com senha inválida
    Dado o endpoint da API para realizar login
    Quando eu requisito o login passando uma senha inválida
    Então eu recebo  o erro "Invalid password"

@error @notrun
Cenário: Erro ao tentar logar sem passar login
    Dado o endpoint da API para realizar login
    Quando eu requisito o login sem passar login
    Então eu recebo  o erro "Missing email"

@error
Cenário: Erro ao tentar logar sem passar senha
    Dado o endpoint da API para realizar login
    Quando eu requisito o login sem passar senha
    Então eu recebo o erro "Missing password"