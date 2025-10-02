-- Exemplo para um RENAME de coluna somente se a coluna antiga existir
SET @exists := (
  SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'chats_mensagens_chat'
    AND COLUMN_NAME = 'mensagens_conversa_id'
);

SET @sql := IF(@exists > 0,
  'ALTER TABLE `chats_mensagens_chat` RENAME COLUMN `mensagens_conversa_id` TO `mensagens_chat_id`',
  'SELECT 1');

PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Repita o padrão acima para qualquer outro RENAME/ALTER/INDEX daquela migration
