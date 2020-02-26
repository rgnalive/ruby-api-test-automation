# language: pt

@unknown @list
Funcionalidade: List Unknowns
    Como um usuário do sistema
    Eu quero poder listar os unknowns existentes
    A fim de visualizá-los

@success
Cenário: Listar todos os unknowns existentes na primeira página
    Dado o endpoint da API para listar unknowns
    Quando eu listar os unknowns sem especificar nenhum parâmetro
    Então eu recebo os unknowns existentes na página 1 com um limite de 6 unknowns por página
    E recebo o status 200

@success
Cenário: Listar todos os unknowns existentes na segunda página
    Dado o endpoint da API para listar unknowns
    Quando eu listar os unknowns passando o parâmetro page igual a 2
    Então eu recebo os unknowns existentes na página 2 com um limite de 6 unknowns por página
    E recebo o status 200