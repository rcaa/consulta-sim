Feature: Consulta
  As a Paciente
  I want to criar, visualizar, atualizar e deletar minha consulta
  So that eu nao tenha que fazer isso de forma manual ou presencial

  Scenario: agendar consulta
    Given eu estou na pagina de criar consulta
    When eu preencho os campos data '2023-05-05', horario '11:00',paciente 'Rodrigo' ,medico 'Ricardo'
    And eu clico em cadastrar nova consulta
    Then eu vejo uma mensagem "consulta foi cadastrado com sucesso"

  Scenario: Criar uma consulta com horario não coberto pelo medico
    Given eu estou na pagina de criar consulta
    When eu preencho os campos data '2023-05-05', horario '12:00',paciente 'Rodrigo' ,medico 'Ricardo'
    And eu clico em cadastrar nova consulta
    Then eu vejo uma mensagem "horario invalido"