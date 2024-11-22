CREATE OR REPLACE FUNCTION verificar_dia_alteracao_produto()
RETURNS TRIGGER AS $$
BEGIN
    IF TO_CHAR(CURRENT_DATE, 'Day') ~* '(sábado|domingo|segunda-feira)' THEN
        RAISE EXCEPTION 'NÃO É POSSÍVEL FAZER ALTERAÇÕES NOS PRODUTOS NO SÁBADO, DOMINGO OU SEGUNDA';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TG_DO_SOMETHING_IN_PRODUTO_ON_SSD
BEFORE INSERT OR UPDATE OR DELETE
ON produto
FOR EACH ROW
EXECUTE FUNCTION verificar_dia_alteracao_produto();