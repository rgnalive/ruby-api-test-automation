# language: pt

@unknown @get
Funcionalidade: Get Unknown
    Como um usuário do sistema
    Eu quero poder buscar um unknown específico
    A fim de visualizá-lo

@success
Cenário: Buscar um unknown específico com sucesso
    Dado o endpoint da API para buscar um unknown específico
    Quando eu buscar um unknown por id existente
    Então eu recebo informações apenas do unknown com o id especificado
    E recebo o status 200

@success
Cenário: Buscar um unknown inexistente
    Dado o endpoint da API para buscar um unknown específico
    Quando eu buscar um unknown por id inexistente
    Então eu recebo uma lista vazia
    E recebo o status 404