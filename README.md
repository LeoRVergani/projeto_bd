Para começar, vamos desenvolver um banco de dados no PostgreSQL seguindo as suas instruções. Vou fornecer o código SQL para cada etapa do processo: criação do banco de dados, criação de tabelas, inserção de dados e utilização de `JOINs` para consultas.

### Passo 1: Criar a Base de Dados
```sql
CREATE DATABASE projeto_bd;
```

### Passo 2: Criar Tabelas e Atributos
Vamos criar três tabelas como exemplo: `clientes`, `pedidos` e `produtos`.

```sql
-- Conectar ao banco de dados criado
\c projeto_bd;

-- Criar tabela de clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Criar tabela de produtos
CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Criar tabela de pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL DEFAULT CURRENT_DATE
);
```

### Passo 3: Inserir Dados nas Tabelas

```sql
-- Inserir dados na tabela de clientes
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com');

-- Inserir dados na tabela de produtos
INSERT INTO produtos (nome, preco) VALUES
('Produto A', 10.50),
('Produto B', 20.00);

-- Inserir dados na tabela de pedidos
INSERT INTO pedidos (cliente_id, produto_id, quantidade) VALUES
(1, 1, 2),
(2, 2, 1),
(1, 2, 3);
```

### Passo 4: Consultas Utilizando Joins

```sql
-- Consulta para obter todos os pedidos com detalhes dos clientes e produtos
SELECT 
    p.pedido_id,
    c.nome AS cliente_nome,
    pr.nome AS produto_nome,
    p.quantidade,
    p.data_pedido
FROM 
    pedidos p
JOIN 
    clientes c ON p.cliente_id = c.cliente_id
JOIN 
    produtos pr ON p.produto_id = pr.produto_id;

-- Consulta para obter a soma total dos pedidos por cliente
SELECT 
    c.nome AS cliente_nome,
    SUM(pr.preco * p.quantidade) AS total_gasto
FROM 
    pedidos p
JOIN 
    clientes c ON p.cliente_id = c.cliente_id
JOIN 
    produtos pr ON p.produto_id = pr.produto_id
GROUP BY 
    c.nome;
```

### Passo 5: Subir o Código para o GitHub
Para compartilhar o projeto no GitHub, siga estes passos:

1. **Inicialize um repositório Git** no seu IDE (ou linha de comando).
2. **Adicione os arquivos** com o código SQL no repositório.
3. **Faça commit** das mudanças.
4. **Suba o repositório** para o GitHub.

Aqui está um exemplo de como fazer isso usando a linha de comando:

```bash
# Navegar até o diretório do projeto
cd caminho/para/seu/projeto

# Inicializar um repositório Git
git init

# Adicionar os arquivos ao repositório
git add .

# Fazer commit das mudanças
git commit -m "Inicializar projeto com script SQL"

# Adicionar o repositório remoto (substitua pelo seu URL do GitHub)
git remote add origin https://github.com/seu-usuario/projeto_bd.git

# Subir o projeto para o GitHub
git push -u origin master
```
