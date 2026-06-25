-- =========================================================
-- Script de criação das tabelas do Sistema de Biblioteca
-- Ordem: categorias -> autores -> usuarios -> livros -> livros_autores -> emprestimos
-- =========================================================

-- 1. Categorias 
DROP TABLE IF EXISTS categorias CASCADE;
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Autores 
DROP TABLE IF EXISTS autores CASCADE;
CREATE TABLE autores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

-- 3. Usuários 
DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE,
    
    CHECK (email LIKE '%@%')
);

-- 4. Livros 
DROP TABLE IF EXISTS livros CASCADE;
CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 5. Livros Autores 
DROP TABLE IF EXISTS livros_autores CASCADE;
CREATE TABLE livros_autores (
    livro_id INT NOT NULL,
    autor_id INT NOT NULL,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- 6. Empréstimos 
DROP TABLE IF EXISTS emprestimos CASCADE;
CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    livro_id INT NOT NULL,
    data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'emprestado',
    
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    
    CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo),
    CHECK (status IN ('emprestado', 'devolvido', 'atrasado'))
);