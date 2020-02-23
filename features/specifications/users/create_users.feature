#language: pt

@users @create
Funcionalidade: Create User
    Como um usuário do sistema
    Eu quero poder cadastrar um users
    A fim de cadastrar novos users

@success
Cenário: Criar um user com sucesso
    Dado o endpoint da API para cadastrar users
    Quando eu requisitar o cadastro de user
    Então eu recebo os dados do user de volta com o id gerado e data e hora da criação
    E as informações cadastradas do user foram persistidas na base de dados
    E recebo o status 201

@error @notrun
Cenário: Tentar criar um user já existente
    Dados o endpoint da API para cadastrar users
    Quando eu requisitar o cadastro de user com um name já existente
    Então eu recebo a mensagem User already exists.
    E recebo o status 400