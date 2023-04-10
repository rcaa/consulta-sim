Feature: Paciente
  As a paciente
  I want to adicionar, remover, vizualizar, e editar um paciente
  So that eu nao tenha que fazer isso manualmente ou presencialmente

  Scenario: cadastrar paciente
    Given que eu esteja na tela de cadastro de paciente
    When eu preencho os campos nome 'Rian Wilker', data_nascimento '2000-12-27', cpf '06725779417', email 'email@email.com', logradouro 'rua das Ruas', complemento 'Na esquina', cep '11111-112', bairro 'Boa Vista' e cidade 'Garanhuns'
    And eu clicar em salvar
    Then o paciente deve ser cadastrado com sucesso

  Scenario: deletar paciente
    Given paciente de nome 'Luiz Fellipe', data_nascimento '2000-12-26', cpf '06725779417', email 'luiz@gmail.com', logradouro 'Rua das ruas', complemento 'Street', cep '11111-116', bairro 'Times Square' e cidade 'Nova York'
    When que eu esteja na tela de paciente
    And seleciono o paciente que quero excluir
    And eu clicar em deletar
    Then o paciente deve ser deletado com sucesso