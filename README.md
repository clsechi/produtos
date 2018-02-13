# README

# Gerenciamento de Produtos

Este é o terceiro projeto que fizemos na Campus Code.

Trata-se de uma representação minimalista de um sistema de gerenciamento de produtos e suas dependências.

O sistema está dividido em duas partes, interface com o usuário e uma API que interage com outras aplicações externas.

Na interface do usuário, o mesmo é capaz de cadastrar categorias, produtos e planos com seus devidos preços e suas periodicidades.

Já a API é responsável por enviar dados no formato JSON do conteúdo cadastrado no banco de dados.

Inicialização:
Para iniciar a aplicação basta utilizar o comando bin/setup via terminal.

Gems usadas em produção
  - LocaStyle       (CSS)
  - Devise          (Autenticação)
  - Paperclip       (Upload de imagens)
  - Jquery          (Gerenciamento dinâmico de DOM)

Gems usadas para testes
  - Rspec Rails         (TDD)
  - Capybara            (TDD)
  - Simplecov           (Cobertura de testes)
  - Rubocop             (Boas práticas no código)
  - Factory Bot Rails   (Otimização de código)

Para o projeto, o time utilizou o trello como referência e organização de forma que cada história individualmente gerasse valor ao projeto.   
https://trello.com/b/xjccfS5P/time-produtos-qsd

Usuário
  - Email - user@email.com
  - Senha - 123456

TEAM

Carlos Sechi
https://github.com/clsechi

Davi Carvalho
https://github.com/davicfg

Italo Almeida
https://github.com/italoalmeida89

Luiz Gustavo Venarusso
https://github.com/LuizVenarusso

Thiago Morais
https://github.com/thiagolmorais

# API

## Categoria

GET **/api/categories** ( Retorna todas categorias )
> ###### Sucesso
> status 200 <br>
```json
{
   "categories":[
      {
         "id":1,
         "name":"Hospedagem",
         "description":"Domínio grátis e sites ilimitados"
      },
      {
         "id":2,
         "name":"Crie seu site",
         "description":"Criador de site"
      }
   ]
}
```
> ###### Falha
> status 404 <br>
```json
{
   "message":"Nenhuma categoria encontrada"
}
```

GET **/api/categories/[:category_id]** ( Retorna uma categoria específica )
>###### Sucesso
> status 200 <br>
```json
{
   "categories":{
      "id":1,
      "name":"Hospedagem",
      "description":"Domínio grátis e sites ilimitados"
   }
}
```

>###### Falha
> status 404 <br>
```json
{
   "message":"Nenhuma categoria encontrada"
}
```
## Produtos

GET  **/api/categories/[:category_id]/products** ( Retorna todos os produtos de uma categoria )
>###### Sucesso
> status 200 <br>
```json
{
   "categories":{
      "id":"1"
   },
   "products":[
      {
         "id":1,
         "name":"Hospedagem",
         "description":"Hospedagem ilimitada",
         "product_key":"HOSP123",
         "product_category_id":1,
         "contract":"contrato123",
         "icon_url":"/system/products/icons/000/000/001/thumb/img.png?1518205431"
      },
      {
         "id":2,
         "name":"Hospedagem",
         "description":"Hospedagem básica",
         "product_key":"HOSP124",
         "product_category_id":1,
         "contract":"contrato124",
         "icon_url":"/system/products/icons/000/000/002/thumb/img.png?1518205431"
      }
   ]
}
```

>###### Falha
> status 404 <br>
```json
{
   "categories":{
      "id":1
   },
   "products":[
   ]
}
```

GET **/api/products/:id** ( Retorna um produto específico )

>###### Sucesso
> status 200 <br>
```json
{
   "products":{
      "id":1,
      "name":"Hospedagem",
      "description":"Hospedagem ilimitada",
      "product_key":"HOSP123",
      "product_category_id":1,
      "contract":"contrato123",
      "icon_url":"/system/products/icons/000/000/001/thumb/img.png?1518205865"
   }
}
```

>###### Falha
> status 404 <br>
```json
{
   "message":"Nenhum produto encontrado"
}
```
## Planos

GET **/api/products/[:product_id]/product_plans** (Retorna todos os planos de um produto)
>###### Sucesso
> status 200 <br>
```json
{
   "products":{
      "id":"1"
   },
   "plans":[
      {
         "id":1,
         "product_id":1,
         "name":"Hospedagem Ilimitada I",
         "status":true
      },
      {
         "id":2,
         "product_id":1,
         "name":"Hospedagem Ilimitada I",
         "status":false
      }
   ]
}
```


GET **/api/product_plans/:id** ( Retorna um plano específico )
>###### Sucesso
> status 200 <br>
```json
{
   "plans":{
      "id":1,
      "product_id":1,
      "name":"Hospedagem Ilimitada I"
      "status":"true"
   }
}
```

>###### Falha
> status 404 <br>
```json
{
   "message":"Nenhum plano encontrado"
}
```

## Preços e Periodicidades dos Planos

GET **/api/product_plans/[:product_plan_id]/plan_prices** (Retorna todos os planos de um produto)

>###### Sucesso
> status 200 <br>
```json
{
  "plans":"1",
  "prices":[
     {
        "id":1,
        "product_plan_id":1,
        "value":"100.0",
        "periodicity":{
           "id":1,
           "name":"Anual",
           "period":12
        }
     },
     {
        "id":2,
        "product_plan_id":1,
        "value":"100.0",
        "periodicity":{
           "id":2,
           "name":"Mensal",
           "period":1
        }
     }
  ]
}
```
>###### Falha
> status 404 <br>
```json
{
   "plans": 1,
   "prices":[
   ]
}
```

