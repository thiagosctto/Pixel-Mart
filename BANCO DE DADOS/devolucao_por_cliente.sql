SELECT 
    cf.nome_cliente AS Cliente, 
    d.motivo_devol AS Motivo, 
    d.data_devolucao AS Data_Devolucao, 
    d.quant_devol AS Quantidade
FROM 
    devolucao d
INNER JOIN 
    pedido p ON d.pedidoID_pedido = p.ID_Pedido
INNER JOIN 
    cliente_final cf ON p.ID_cliente = cf.ID_cliente;
