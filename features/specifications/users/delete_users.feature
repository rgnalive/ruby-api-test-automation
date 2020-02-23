#language: pt

@users @delete
Funcionalidade: Delete User
    Como um usuário do sistema
    Eu querio poder excluir users
    A fim de excluir users cadastrados

@success
Cenário: Excluir um user com sucesso
    Dado o endpoint da API para excluir users
    Quando eu requisitar a exclusão de user informando um id existente
    Então as informações do user foram removidas da base de dados
    E recebo o status 204 

@error
Cenário: Falha ao tentar excluir um user inexistente
    Dado o endpoint da API para excluir users
    Quando eu requisitar a exclusão de user informando um id inexistente
    Então recebo o status 204
