Feature:
  As a paciente
  I want to criar, editar, remover e visualizar meu cadastro
  So that possa manter atualizado meu cadastro

  Scenario: cadastrar paciente com email invalido
    Given Estou na pagina de cadastrar paciente
    When eu preencho um paciente de nome: 'Rogério Lacerda', data_nascimeto: '20/03/2000', cpf: '12015559493', email: 'teste', logradouro 'Rua dos guarapas', complemento '1 andar', cep '55022-220', bairro 'rendeiras',  cidade 'caruaru' e clico cadastrar
    Then vejo  uma mensagem de erro de email invalido

  Scenario: cadastrar paciente com nome invalido
    Given Estou na pagina de cadastrar paciente
    When eu preencho um paciente de nome: 'Rog', data_nascimeto: '20/03/2000', cpf: '12015559493', email: 'teste@gmail.com', logradouro 'Rua dos guarapas', complemento '1 andar', cep '55022-220', bairro 'rendeiras',  cidade 'caruaru' e clico cadastrar
    Then vejo  uma mensagem de erro de nome invalido