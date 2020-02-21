#language: pt
#encoding: utf-8

@users @create
Funcionalidade: Create User
    Como um usuário do sistema
    Eu quero poder cadastrar um users
    A fim de cadastrar novos users

Cenário: Create an user
    Dado o endpoint da API para cadastrar users
    Quando eu requisitar o cadastro de user
    Então eu recebo os dados do user de volta com o id gerado e data e hora da criação
    E as informações cadastradas do user foram persistidas na base de dados
    E recebo o status 201