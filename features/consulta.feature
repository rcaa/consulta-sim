Feature: Consulta
  As a paciente
  I want to agendar, remover, visualizar e editar minha
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: Angendar consulta
    Given que estou na pagina de agendamento de consulta
    And medico de nome 'Emily Santos', cpf '06725779417', email 'emilyy@gmail.com', especialidade 'Pediatra' e crm '12335' existe
    And paciente de nome 'Luiz Jose da Silva', data_nascimento '2000-12-25', cpf '06725779417', email 'luizd53@gmail.com', logradouro 'Rua dos Bobos 20', complemento 'Rua', cep '11111-121', bairro 'Bairro' e cidade 'Arcoverde'
    When eu preencho os campos de data '2023-11-11' e horario '10:00' e medico 'Emily Santos' e paciente 'Luiz Jose da Silva'
    And eu clico em angendar consulta
    Then eu vejo a mensagem 'Consulta agendada com sucesso'

  Scenario: Vizualizar consulta
    Given medico de nome 'Luiz Fellipe', cpf '06725779417', email 'luiz@gmail.com', especialidade 'Cardiologista' e crm '12235' existe
    And paciente de nome 'Luiz Jose', data_nascimento '2000-12-25', cpf '06725779417', email 'luizd533@gmail.com', logradouro 'Rua dos Bobos 20', complemento 'Rua', cep '11111-151', bairro 'Bairro' e cidade 'Garanhuns'
    When que estou na pagina de consulta
    And visito a consulta desejada
    Then eu vejo os dados da consulta