 -- V2_2_3__add_fk_mensagens_chat.sql (versão idempotente)
SET @fk_exists := (
  SELECT COUNT(*)
  FROM information_schema.REFERENTIAL_CONSTRAINTS
  WHERE CONSTRAINT_SCHEMA = DATABASE()
    AND CONSTRAINT_NAME = 'fk_cmc_mensagem'
);

SET @ddl := IF(
  @fk_exists = 0,
  'ALTER TABLE chats_mensagens_chat
  ADD CONSTRAINT fk_cmc_mensagem
  FOREIGN KEY (mensagens_chat_id)
  REFERENCES mensagens_conversa (id_mensagem_conversa)
  ON UPDATE RESTRICT
  ON DELETE CASCADE;',
  'DO 0'
);

PREPARE stmt FROM @ddl;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

