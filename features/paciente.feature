Feature: Paciente
  As a Paciente
  I want to criar, visualizar, atualizar e deletar meu cadastro
  So that automatizar e facilizar o meu atendimento

  Scenario: remover paciente
    Given eu estou na pagina de paciente
    And eu vejo um paciente com cpf '46482109306'
    When eu clico em remover o paciente
    Then eu vejo uma mensagem que o paciente com cpf '46482109306' foi removido

  Scenario: criar paciente com todos os dados em branco
    Given eu estou na pagina de paciente
    When eu preecho o nome '', cpf '',email '', data_de_nascimento '', cep '', logradouro '',cidade '',bairro '' e complemento ''
    And clico em criar paciente
    Then Eu vejo uma mensagem de paciente invalido