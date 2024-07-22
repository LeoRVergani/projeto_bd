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
