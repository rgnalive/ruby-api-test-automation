#language: pt

@users @update
Funcionalidade: Update User
    Como um usuário do sistema
    Eu quero poder alterar um user
    A fim de alterar users já cadastrados

@success
Cenário: Alterar um user com sucesso
    Dado o endpoint da API para alterar users
    Quando eu requisitar a alteração de user informando um id existente
    Então recebo os dados do user atualizados de volta com a data e hora de atualização
    E as informações alteradas do user foram persistidas na base de dados
    E recebo o status 200

@error @notrun
Cenário: Falha ao tentar alterar um user inexistente
    Dado o endpoint da API para alterar users
    Quando eu requisitar a alteração de user informando um id inexistente
    Então recebo o status 404