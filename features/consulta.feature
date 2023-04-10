Feature: Consulta
  As a paciente
  I want to agendar, remover, visualizar e editar minha
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: Angendar consulta
    Given que estou na pagina de agendamento de consulta
    And medico de nome 'Rian', cpf '11697785445', email 'rian@gmail.comm', especialidade 'Pediatra' e crm '000000' existe
    And paciente de nome 'Maria Lyvia', data_nascimento '25/03/2003', cpf '11697785425', email 'lyvia@gmail.com', logradouro 'Rua b', complemento 'rua', cep '55365-055', bairro 'bairro' e cidade 'Garanhuns'
    When eu preencho os campos de data '15/06/2023' e horario '15:00' e medico 'Rian' e paciente 'Maria Lyvia'
    And eu clico em angendar consulta
    Then eu vejo a mensagem 'Consulta agendada com sucesso'

  Scenario: Vizualizar consulta
    Given medico de nome 'Maria Lyvia', cpf '11697785425', email 'lyvia@gmail.com', especialidade 'Cardiologista' e crm '111111' existe
    And paciente de nome 'Rian', data_nascimento '20/11/2001', cpf '11697785445', email 'rian@gmail.com', logradouro 'Rua a', complemento 'rua', cep '55365-045', bairro 'bairro' e cidade 'Capoeiras'
    When que estou na pagina de consulta
    And visito a consulta desejada
    Then eu vejo os dados da consulta