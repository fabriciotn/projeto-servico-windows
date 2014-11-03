SELECT u.id, u.nome, u.numero_cartao, u.data_fecha, ur.numero_reserva
, s.nome_salao, s.bairro, s.cep, s.endereco, s.contato, s.telefone, s.participa_promocao
FROM  usuario u
INNER JOIN usuario_reserva ur ON ur.id_usuario = u.id
INNER JOIN salao s ON s.id = ur.id_salao;