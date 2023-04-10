Feature: CRUD do Medico
  As a Medico do site
  I want to me cadastrar, editar, consultar e excluir meus dados
  So that para manter meus dados atualizados


  Scenario: cadastrar Medico
    Given estou na tela de criar Medico
    When eu preencho os campos de nome com 'Dr Araujo', com o CPF '63277132200', com o email 'araujo@hotmail.com', com a Especialidade 'Pediatra' e com o CRM '12121'
    And clico em Create Medico
    Then Eu vejo a pagina do Medico 'Dr Araujo'

  Scenario: cadastrar medico com nome invalido
      Given estou na tela de criar Medico
      When eu preencho os campos de nome com '', com o CPF '87108324598', com o email 'araujo@hotmail.com', com a Especialidade 'Pediatra' e com o CRM '12121'
      And clico em Create Medico
      Then Eu vejo a mesagem "Nome can't be blank"