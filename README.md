# README



## API

GET **/api/categories** (Retorna todas categorias)
> ###### Sucesso
> status 200 <br>
> {"categories":[{"id":1,"name":"Hospedagem","description":"Domínio grátis e sites ilimitados"},{"id":2,"name":"Crie seu site","description":"Criador de site"}]}
>
> ###### Falha
> status 404 <br>
> {"message":"Nenhuma categoria encontrada"}

GET **/api/categories/[:id_category]** (Retorna uma categoria específica)
>###### Sucesso
> status 200 <br>
> {"categories":{"id":1,"name":"Hospedagem","description":"Domínio grátis e sites ilimitados"}}

>###### Falha
> status 404 <br>
> {"message":"Nenhuma categoria encontrada"}

<br>
GET **/api/categories/[:id_category]/products** (Retorna todos os produtos de uma categoria)

GET **/api/products/[:id_product]/plans** (Retorna todos os planos de um produto)

GET **/api/plans/[:id_plan]/prices** (Retorna todos os preços de um plano)


<br><br>
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
