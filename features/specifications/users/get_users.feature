#language: pt

@users @list
Funcionalidade: List Users
    Como um usuário do sistema
    Eu quero poder listar os users existentes
    A fim de visualizá-los

Contexto:
    Dado o endpoint da API para listar users

Cenário: Listar todos os users existentes na primeira página
    Quando eu listar users sem especificar nenhum parâmetro
    Então eu recebo os users existentes na primeira página com um limite de 5 users por página
    E recebo o status 200

@pagination
Cenário: Listar todos os users existentes na segunda página
    Quando eu listar users passando o parâmetro page igual a 2
    Então eu recebo os users existentes na segunda página com um limite de 5 users por página
    E recebo o status 200

@delay
Cenário: Listar todos os users existentes na primeira página com delay de 3 segundos
    Quando eu listar users passando o parâmetro delay igual a 3
    Então eu recebo os users existentes depois de 3 segundos
    E recebo o status 200



@users @single
Funcionalidade: Get Single User
    Como um usuário do sistema
    Eu quero poder buscar um user específico
    A fim de viualizá-lo

Contexto:
    Dado o endpoint da API para buscar um user específico

Cenário: Buscar um user epecífico com sucesso
    Quando eu buscar um user por id existente
    Então eu recebo informações apenas no user com o id especificado
    E recebo o status 200

Cenário: Buscar um user inexistente
    Quando eu buscar um user por id inexistente
    Então eu recebo uma lista vazia
    E recebo o status 200