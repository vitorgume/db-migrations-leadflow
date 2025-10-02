-- Remover FK e índice únicos atuais
ALTER TABLE chats DROP FOREIGN KEY fk_chats_cliente;
ALTER TABLE chats DROP INDEX uk_chats_cliente;

-- Renomear a coluna para o nome que o Hibernate espera
-- (garanta que o tipo é o MESMO da PK em clientes: BINARY(16) no seu caso)
ALTER TABLE chats CHANGE COLUMN cliente_id cliente_id_cliente BINARY(16) NULL;

-- Recriar o índice único (se a relação 1-1 for obrigatória para você)
CREATE UNIQUE INDEX uk_chats_cliente ON chats (cliente_id_cliente);

-- Recriar a FK com o novo nome de coluna
ALTER TABLE chats
  ADD CONSTRAINT fk_chats_cliente
  FOREIGN KEY (cliente_id_cliente) REFERENCES clientes (id_cliente)
  ON UPDATE RESTRICT ON DELETE SET NULL;
