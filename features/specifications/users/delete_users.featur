#language: pt
#encoding: utf-8

@users @delete
Funcionalidade: Delete User
    Como um usuário do sistema
    Eu querio poder excluir users
    A fim de excluir users cadastrados

Cenário: Excluir um user com sucesso
    Dado o endpoint da API para excluir users
    Quando eu requisitar a exclusão de user informando um id existente
    Então recebo o status 204
    E as informações do user foram removidas da base de dados

@error
Cenário: Falha ao tentar excluir um user inexistente
    Dado o endpoint da API para excluir users
    Quando eu requisitar a exclusão de user informando um id inexistente
    Então recebo o status 404
