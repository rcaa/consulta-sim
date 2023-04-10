Feature: Consulta medica
  As a como paciente do site
  I want to agendar uma consulta medica
  So that eu possa ser atendido por um medico

  Scenario: Excluir Consulta
    Given estou na tela da consulta que sera excluida
    And clico em Deletar consulta
    Then Eu vejo a pagina da 'Consulta'

  Scenario: Editar Consulta
      Given estou na tela da consulta que sera editada
      And clico em Update Consulta
      Then Eu vejo a mensagem 'Consulta was successfully updated'
