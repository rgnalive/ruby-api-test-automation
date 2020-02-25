# language: pt

@register
Funcionalidade: Registrar User
    Como um usuário master do sistema
    Eu quero poder registrar novos users
    A fim de registrar novos users na aplicação

@success
Cenário: Registrar user com sucesso
    Dado o endpoint da API de registrar users
    Quando eu requisitar o registro de um user completo
    Então eu devo receber o Id do user e o Token de sessão
    E recebo o status 200

@error
Cenário: Falha ao tentar registrar user sem senha
    Dado o endpoint da API de registrar users
    Quando eu requisitar o registro de um user sem senha
    Então eu devo receber o erro "error: \"Missing password\""
    E recebo o status 400

@error
Cenário: Falha ao tentar registrar user sem email
    Dado o endpoint da API de registrar users
    Quando eu requisitar o registro de um user sem email
    Então eu devo receber o erro "error: \"Missing email\""
    E recebo o status 400

@error
Cenário: Falha ao tentar registrar user com email inválido
    Dado o endpoint da API de registrar users
    Quando eu requisitar o registro de um user com email inválido
    Então eu devo receber o erro "error: \"Invalid email\""
    E recebo o status 400