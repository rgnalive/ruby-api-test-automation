#language: pt
@cards
Funcionalidade: Get Cards
Como um usuário do sistema
Eu quero realizar requisições no endpoint cards
A fim de consultar cards

Contexto:
Dado o endpoint da API para consultar Cards

Cenario: Consultar cards sem parâmetros
Quando eu realizar um get no endpoint cards sem parâmetros
Então devo visualizar no máximo 100 Cards por página no retorno
E devo receber o status_code 200

@name
Cenário: Consultar cards por name
Quando eu realizar um get no endpoint cards buscando pelo name "nissa"
Então devo visualizar somente Cards com o name "nissa"
E devo receber o status_code 200

@name @notrun
Cenário: Consultar cards utilizando mais de um name na mesma querystring
Quando eu realizar um get no endpoint cards buscando pelos names "nissa" e "jace" separados por vírgula
Então devo visualizar somente Cards que possuam os names "nissa" ou "jace"
E devo receber o status_code 200

# @name
# Cenário: Consultar cards por name utilizando a condicional OR
#     Quando eu realizar um get no endpoint cards buscando por dois names separados por pipeline
#     Então devo visualizar somente Cards com o primeiro name ou com o segundo name
#     E devo receber o status_code 200