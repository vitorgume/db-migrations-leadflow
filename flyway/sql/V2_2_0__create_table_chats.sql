CREATE TABLE chats (
  id             BINARY(16)   NOT NULL,
  data_criacao   DATETIME(6),
  cliente_id     BINARY(16),
  PRIMARY KEY (id),
  UNIQUE KEY uk_chats_cliente (cliente_id),        
  CONSTRAINT fk_chats_cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente)
      ON UPDATE RESTRICT ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE chats_mensagens_chat (
  chat_id            BINARY(16) NOT NULL,
  mensagens_conversa_id  BINARY(16) NOT NULL,
  PRIMARY KEY (chat_id, mensagens_conversa_id),
  KEY idx_cmc_mensagem (mensagens_conversa_id),
  CONSTRAINT fk_cmc_chat
    FOREIGN KEY (chat_id) REFERENCES chats (id)
      ON UPDATE RESTRICT ON DELETE CASCADE,
  CONSTRAINT fk_cmc_mensagem
    FOREIGN KEY (mensagens_conversa_id) REFERENCES mensagens_conversa (id_mensagem_conversa)
      ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
