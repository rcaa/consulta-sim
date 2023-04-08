Feature: Consulta
  As a Paciente
  I want to agendar uma consulta
  So that eu possa ser atendido por um medico

  Scenario: Agender consulta
    Given estou na tela de agendar nova consulta
    When seleciono a data '06/11/2023', as '11:00' horas
    And eu seleciono o paciente de nome 'G Vilaca', nascimento "2001-04-25", cpf '188.037.351-35', email 'gison@gmail.com', logradouro 'Rua do Educandario', complemento 'Casa', cep '55435-000', bairro 'Parque Alvorada',  cidade 'Sao Joao'
    When seleciono o medico de nome 'Gison V M', cpf '729.437.510-06', email 'doutor@gmail.com', especialidade 'cirurgiao', crm '223456'
    And clico em Criar Consulta
    Then eu vejo a mensagem de que a consulta foi agendada com sucesso

  Scenario: Agendar consulta com data invalida
    Given estou na tela de agendar nova consulta
    When eu seleciono o paciente de nome 'G Vilaca M', nascimento "2001-04-25", cpf '188.037.351-35', email 'gison@gmail.com', logradouro 'Rua do Educandario', complemento 'Casa', cep '55435-000', bairro 'Parque Alvorada',  cidade 'Sao Joao'
    And seleciono o medico de nome 'Gison Vilaca M', cpf '972.805.328-29', email 'doutor@gmail.com', especialidade 'clinico geral', crm '113456'
    When seleciono a data '06/11/2022', as '11:00' horas
    And clico em Criar Consulta
    Then eu vejo a mensagem de erro informando que data ja passou

