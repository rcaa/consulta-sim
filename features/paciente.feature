Feature: Paciente
  As a paciente
  I want to adicionar, remover, vizualizar, e editar um paciente
  So that eu nao tenha que fazer isso manualmente ou presencialmente

  Scenario: cadastrar paciente
    Given que eu esteja na tela de cadastro de paciente
    When eu preencho os campos nome 'Rian Wilker', data_nascimento '2000-12-23', cpf '06725779417', email 'email@email.com', logradouro 'rua das ruas', complemento 'rua', cep '111111-11', bairro 'bairro' e cidade 'cidade'
    And eu clicar em salvar
    Then o paciente deve ser cadastrado com sucesso

  Scenario: deletar paciente
    Given paciente de nome 'Luiz Fellipe', data_nascimento '2000-12-23', cpf '06725779417', email 'luiz@gmail.com', logradouro 'rua das ruas', complemento 'rua', cep '11111-111', bairro 'bairro' e cidade 'cidade'
    When que eu esteja na tela de paciente
    And seleciono o paciente que quero excluir
    And eu clicar em deletar
    Then o paciente deve ser deletado com sucesso