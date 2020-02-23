#language: pt

@users @list
Funcionalidade: List Users
    Como um usuário do sistema
    Eu quero poder listar os users existentes
    A fim de visualizá-los

@success
Cenário: Listar todos os users existentes na primeira página
    Dado o endpoint da API para listar users
    Quando eu listar users sem especificar nenhum parâmetro
    Então eu recebo os users existentes na primeira página com um limite de 5 users por página
    E recebo o status 200

@success @pagination
Cenário: Listar todos os users existentes na segunda página
    Dado o endpoint da API para listar users
    Quando eu listar users passando o parâmetro page igual a 2
    Então eu recebo os users existentes na segunda página com um limite de 5 users por página
    E recebo o status 200

@success @delay
Cenário: Listar todos os users existentes na primeira página com delay de 3 segundos
    Dado o endpoint da API para listar users
    Quando eu listar users passando o parâmetro delay igual a 3
    Então eu recebo os users existentes depois de 3 segundos
    E recebo o status 200