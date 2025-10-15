-- Tabela principal
CREATE TABLE medias_clientes (
  id                BINARY(16) NOT NULL,
  telefone_cliente  VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  KEY idx_mc_telefone (telefone_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela 1-N para as URLs
CREATE TABLE medias_clientes_urls (
  id                 BIGINT NOT NULL AUTO_INCREMENT,
  midia_cliente_id   BINARY(16) NOT NULL,
  url                VARCHAR(2048) NOT NULL,
  PRIMARY KEY (id),
  KEY idx_mcu_cliente (midia_cliente_id),
  CONSTRAINT fk_mcu_cliente
    FOREIGN KEY (midia_cliente_id) REFERENCES medias_clientes (id)
      ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
