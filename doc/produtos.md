Produtos
========

Um produto é um item comercializado pela Locaweb. O sistema de gestão de
produtos permite aos times de MKT de produtos cadastrar e configurar novos
produtos, seus preços e condições de vendas.

## Fluxos de Utilização

### Gerenciamento de  Produtos
Cadastro e manutenção de produtos, incluindo dados como nome, descrição, icone e
chave.

### Gerenciamento de Periodicidades
Deve ser possível criar e manter periodicidades que serão utilizadas para
configuração de planos

### Gerenciamento de Planos
Um plano são as possíveis variações comercializadas a partir de um produto. Deve
ser possível criar e manter planos. Um plano nunca pode ser removido da base,
mas pode ser descontinuado, ficando indisponível para consumo externo.

### Gerenciamento de Preços
Para um dado plano, os usuários devem poder configurar os preços do plano para
diferentes periodicidades. Por exemplo, um usuário deve poder configurar para o
plano Hospedagem Básica preços diferentes para as periodicidades Mensal,
Semestral e Anual.

### Consumo de produtos via API
Devem existir endpoints para ver a lista de produtos disponíveis

### Consumo de planos via API
Devem existir endpoints para ver a lista de planos a partir de um produto.

### Consumo de detalhes de um plano via API
Deve existir um endpoint onde, a partir de um identificador de um plano, trazer
todos detalhes do plano.

### Consumo de periodicidades via API
Deve existir um endpoint que ofereça todas periodicidades disponíveis.

### Consumo de preços via API
Dado um plano, deve ser possível consumir os preços alinhados com as
periodicidades.

Deve ser possível criar e manter planos.

## Dados Armazenados

Produtos são identificações generalistas dos grupos de produtos vendidos.

Ex: Hospedagem, E-mail, Registro de dominio, etc.

Um tipo de produto contem:
* Nome
* Descrição
* Icone (imagem)
* Chave do produto

Um plano é a forma que a Locaweb utiliza para comercializar um determinado
produto.

Ex: Hospedagem Básica, Hospedagem Profissional, etc.

Um plano contém:
* Nome
* Descrição
* Produto
* Detalhes (n)

Uma periodicidade é o periodo de cobrança de um determinado plano.

Ex: Mensal, Trimestral, Anual, etc.

Uma periodicidade contem:
* Nome
* Prazo em meses

Preço é o agrupamento de uma periodicidade e um plano:

Ex: Hospedagem Básica Mensal R$ 50, Hospedagem Básica Semestral R$ 200

Preço
* Valor
* Plano
* Periodicidade


## Dados Armazenados

Os dados que serão armazenados e manipulados durante as interações com o sistema são:

* **Produto** : nome, descrição completa, ícone, categoria (?), contrato.
* **Categoria** : de Produto: nome, descrição completa. (?)
* **Periodicidade**: nome, período (em dias ou meses).
* **Plano**: produto, prazo de duração.
* **Preço**: plano, valor (em reais).

### Controle de Acesso

O acesso a aplicação poderá ser feito por usuários previamente cadastrados. O acesso será garantido através do uso de um email de identificação e de uma senha.

### Interfaces

O sistema terá toda sua interface regida pelas regras descritas na documentação do Locaweb Style (LocaStyle).
