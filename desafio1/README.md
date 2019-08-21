# Desafio1 :notebook:

Este projeto, é uma simples iterface web, que permite o upload de um arquivo e salva o conteúdo dele no banco de dados.

## Do que você vai precisar :point_down:

Ruby versão: 
```
2.4.3
```

Rails versão:
```
5.0.7.2
```
MySql versão :
```
MySql 5.7.26
```

## Bora rodar esse projeto? :ok_woman:

1. Primeiramente, altere o arquivo _database.yml_, com os dados para a conexão do seu banco de dados.

```
default: &default
  adapter: mysql2
  encoding: utf8
  host: <seu host>
  username: <seu username>
  password: <sua senha>
  
```

2. Agora você precisa alterar o nome da database, para rodar o projeto. Ainda no mesmo arquivo  _database.yml_, nos ambientes, caso você for rodar localmente, você pode alterar apenas o ambiente _development_.

```
development:
  <<: *default
  database: <sua database>
  
```
4. Rodar o Bundle para instalar as depêndencias:
```
bundle install
```
3. Rodar migrations para a crição das tabelas na database:
```
rake db:migrate
```
4. Iniciar o projeto:

```
rails s
```

Prontinho, agora é só começar a fazer o upload para dos seus aquivos, acessando localhost:3000/purchase. :bowtie:
