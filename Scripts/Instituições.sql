ALTER TABLE INSTITUICAO CHANGE COLUMN intituicao_aplicacao instituicao_aplicacao enum('Exame', 'Treinamento');

INSERT INTO INSTITUICAO (nome, instituicao_aplicacao, situacao_registro) VALUES
('Agência Nacional de Aviação Civil (ANAC)', 'Exame', 1),
('Escola de Aviação Asa Dourada', 'Treinamento', 1),
('Instituto de Treinamento Aeronáutico (ITA)', 'Treinamento', 1),
('Centro de Simulação de Voo Aviador', 'Treinamento', 1),
('Instituto Nacional de Meteorologia Aeronáutica', 'Exame', 1),
('Centro de Investigação e Prevenção de Acidentes Aeronáuticos (CENIPA)', 'Exame', 1),
('Escola de Formação de Pilotos SkyHigh', 'Treinamento', 1),
('Universidade de Ciências Aeronáuticas (UCA)', 'Treinamento', 1),
('Centro de Treinamento de Pilotos Comerciais', 'Treinamento', 1),
('Escola Técnica de Manutenção Aeronáutica', 'Treinamento', 1),
('Centro Nacional de Simulação de Aeronaves', 'Exame', 1),
('Escola de Aviação Vento Forte', 'Treinamento', 1),
('Aeroclube do Brasil', 'Exame', 1),
('Instituto de Radiofonia Aeronáutica', 'Exame', 1),
('Centro de Treinamento de Segurança de Voo', 'Treinamento', 1),
('Escola de Emergências e Sobrevivência Aérea', 'Treinamento', 1),
('Instituto de Operação de Aeronaves Multimotores', 'Treinamento', 1),
('Escola de Especialização em Tráfego Aéreo', 'Exame', 1),
('Centro de Formação de Controladores de Voo', 'Exame', 1),
('Escola de Pilotagem de Aeronaves Anfíbias', 'Treinamento', 1);
