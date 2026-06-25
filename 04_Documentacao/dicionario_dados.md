# Dicionário de Dados - Sistema de Biblioteca

Este documento detalha a estrutura das tabelas do banco de dados, explicando o que cada coluna representa.

## Tabela: CATEGORIAS
Armazena os gêneros literários disponíveis na biblioteca.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | SERIAL PRIMARY KEY | ID único e sequencial da categoria. |
| nome_categoria | VARCHAR(50) NOT NULL UNIQUE | Nome da categoria (ex: 'Romance', 'Poesia'). |

## Tabela: AUTORES
Cadastro dos escritores cujas obras compõem o acervo.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | SERIAL PRIMARY KEY | ID único e sequencial do autor. |
| nome | VARCHAR(100) NOT NULL | Nome completo do autor (ex: 'Machado de Assis'). |
| nacionalidade | VARCHAR(50) | Nacionalidade do autor. |
| data_nascimento | DATE | Data de nascimento do autor. |

## Tabela: LIVROS
Catálogo principal de obras disponíveis para empréstimo.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | SERIAL PRIMARY KEY | ID único e sequencial do livro. |
| titulo | VARCHAR(100) NOT NULL | Título do livro (ex: 'Dom Casmurro'). |
| categoria_id | INT NOT NULL | FK → categorias(id). Indica o gênero do livro. |

## Tabela: LIVROS_AUTORES
Tabela de ligação (pivô) para relacionamento muitos-para-muitos.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| livro_id | INT NOT NULL | FK → livros(id). ID do livro. |
| autor_id | INT NOT NULL | FK → autores(id). ID do autor. |

*Nota: Essa estrutura permite que um livro tenha múltiplos autores e um autor tenha escrito múltiplos livros.*

## Tabela: USUARIOS
Cadastro dos membros/leitores da biblioteca.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | SERIAL PRIMARY KEY | ID único e sequencial do usuário. |
| nome | VARCHAR(100) NOT NULL | Nome completo do usuário. |
| email | VARCHAR(100) NOT NULL UNIQUE | Email único para contato. |
| telefone | VARCHAR(20) | Telefone de contato. |
| data_cadastro | DATE NOT NULL DEFAULT CURRENT_DATE | Data em que o usuário se cadastrou. |

## Tabela: EMPRESTIMOS
Registro histórico de todas as retiradas e devoluções de livros.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | SERIAL PRIMARY KEY | ID único e sequencial do empréstimo. |
| usuario_id | INT NOT NULL | FK → usuarios(id). Quem pegou o livro. |
| livro_id | INT NOT NULL | FK → livros(id). Qual livro foi emprestado. |
| data_emprestimo | DATE NOT NULL DEFAULT CURRENT_DATE | Data da retirada do livro. |
| data_devolucao | DATE | Data da devolução (NULL se ainda não devolvido). |
| status | VARCHAR(20) NOT NULL DEFAULT 'emprestado' | Status atual ('emprestado', 'devolvido', 'atrasado'). |