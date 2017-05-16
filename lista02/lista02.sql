#a
select P.nome, P.cpf, P.email, I.data, I.tipo_inscricao_id, I.codigo from participante_inscricao I join participante P on (I.participante_id = P.id) limit 5;

select P.nome, P.cpf, P.email, I.data, I.tipo_inscricao_id, I.codigo from participante_inscricao I join participante P on (I.participante_id = P.id) limit 5;

select T.descricao from tipo_inscricao T join participante_inscricao A on (T.id = A.tipo_inscricao_id)