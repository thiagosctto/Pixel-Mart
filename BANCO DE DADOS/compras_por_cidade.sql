SELECT 
    cf.nome_cliente AS Cliente, 
    cf.cidade_cliente AS Cidade, 
    p.ID_Pedido AS Pedido, 
    p.data_pedido AS Data
FROM 
    cliente_final cf
INNER JOIN 
    pedido p ON cf.ID_cliente = p.ID_cliente
WHERE 
    cf.cidade_cliente = 'São Paulo';
