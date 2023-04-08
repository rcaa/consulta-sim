Feature: Paciente
  As a Paciente
  I want to criar, editar, visualizar, e excluir minha conta de paciente
  So that eu possa gerenciar minha conta de paciente no sistema

  Scenario: Criar conta de paciente com data de nascimento invalida
    Given estou na tela de criar conta de paciente
    When eu preencho os campos com nome 'Gison Vilaca Morais', nascimento "2031-04-25", cpf '036.735.837-94', email 'gison@gmail.com', logradouro 'Rua do Educandario', complemento 'Casa', cep '55435-000', bairro 'Parque Alvorada',  cidade 'Sao Joao'
    And eu clico em Criar Paciente
    Then vejo uma mensagem de erro informando data de nascimento invalida

  Scenario: Criar conta de paciente com todos os atributos validos
    Given estou na tela de criar conta de paciente
    When eu preencho os campos com nome 'Gison V Morais', nascimento "2001-04-25", cpf '600.463.452-21', email 'gison@gmail.com', logradouro 'Rua do Educandario', complemento 'Casa', cep '55435-000', bairro 'Parque Alvorada',  cidade 'Sao Joao'
    And eu clico em Criar Paciente
    Then vejo uma mensagem informando que a conta de Paciente foi criada com sucesso