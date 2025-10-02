-- Garante que a FK da coluna mensagens_chat_id exista apontando para mensagens_chat(id)
-- (assume que ambas as colunas são BINARY(16); ajuste se for outro tipo)

ALTER TABLE chats_mensagens_chat
  ADD CONSTRAINT fk_cmc_mensagem
  FOREIGN KEY (mensagens_chat_id)
  REFERENCES mensagens_conversa (id_mensagem_conversa)
  ON UPDATE RESTRICT
  ON DELETE CASCADE;
