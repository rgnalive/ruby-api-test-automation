#language: pt

@users @create
Funcionalidade: Create User
    Como um usuário do sistema
    Eu quero poder cadastrar um users
    A fim de cadastrar novos users

Cenário: Cadastrar um user com sucesso
    Dado o endpoint da API para cadastrar users
    Quando eu requisitar o cadastro de user
    Então eu recebo os dados do user de volta com o id gerado e data e hora da criação
    E as informações cadastradas do user foram persistidas na base de dados
    E recebo o status 201


@users @update
Funcionalidade: Update User
    Como um usuário do sistema
    Eu quero poder alterar um user
    A fim de alterar users já cadastrados

Contexto:
    Dado o endpoint da API para alterar users

Cenário: Alterar um user com sucesso
    Quando eu requisitar a alteração de user informando um id existente
    Então recebo os dados do user atualizados de volta com a data e hora de atualização
    E as informações alteradas do user foram persistidas na base de dados
    E recebo o status 200

@error
Cenário: Falha ao tentar alterar um user inexistente
    Quando eu requisitar a alteração de user informando um id inexistente
    Então recebo o status 404


@users @delete
Funcionalidade: Delete User
    Como um usuário do sistema
    Eu querio poder excluir users
    A fim de excluir users cadastrados

Contexto:
    Dado o endpoint da API para excluir users

Cenário: Excluir um user com sucesso
    Quando eu requisitar a exclusão de user informando um id existente
    Então recebo o status 204
    E as informações do user foram removidas da base de dados

@error
Cenário: Falha ao tentar excluir um user inexistente
    Quando eu requisitar a exclusão de user informando um id inexistente
    Então recebo o status 404
