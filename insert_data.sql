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
