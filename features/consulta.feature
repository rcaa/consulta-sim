Feature:
  As a paciente
  I want to criar, editar, remover e visualizar minhas consultas
  So that possa manter as consultas atualizadas

  Scenario: cadastrar consulta com data no passado
    Given Estou na pagina de cadastrar consulta
    When eu preencho a data '20/03/2007', e horario '14:00'
    And seleciono o paciente de nome 'teste'
    And seleciono o medico de nome 'dr teste' e clico Criar consulta
    Then vejo  uma mensagem de erro de data invalida

  Scenario: cadastrar consulta com sucesso
    Given Estou na pagina de cadastrar consulta
    When eu preencho a data '20/03/2024', e horario '09:00'
    And seleciono o paciente de nome 'teste'
    And seleciono o medico de nome 'dr teste' e clico Criar consulta
    Then eu vejo a mensagem de que a consulta foi agendada com sucesso
