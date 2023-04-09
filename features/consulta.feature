Feature: Consulta
  As a Paciente
  I want to criar, visualizar, atualizar e deletar minha consulta
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: agendar consulta
    Given eu estou na pagina de criar consulta
    When eu preencho os campos data '2023-05-05', horario '11:00',paciente 'Rodrigo' ,medico 'Ricardo'
    And eu clico em cadastrar nova consulta
    Then eu vejo uma mensagem "Consulta was successfully created."

  Scenario: Criar uma consulta com data no passado
    Given eu estou na pagina de criar consulta
    When eu preencho os campos data '2023-01-05', horario '08:00',paciente 'Rodrigo' ,medico 'Ricardo'
    And eu clico em cadastrar nova consulta
    Then eu vejo uma mensagem "nao pode ser no passado"