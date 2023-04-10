Feature: Paciente
  As a paciente
  I want to adicionar, remover, vizualizar, e editar um paciente
  So that eu nao tenha que fazer isso manualmente ou presencialmente

  Scenario: cadastrar um paciente
    Given que eu esteja na tela de cadastro de paciente
    When eu preencho os campos nome 'Rian Wilker', data_nascimento '20/11/2001', cpf '11699785825', email 'rina@gmail.com', logradouro 'Rua', complemento 'Mercado', cep '55365-35', bairro 'centro' e cidade 'Capoeiras'
    And eu clicar em salvar
    Then o paciente deve ser cadastrado com sucesso

  Scenario: deletar um  paciente
    Given paciente de nome 'Maria Lyvia', data_nascimento '25/03/2003', cpf '11598785626', email 'lyvia@gmail.com', logradouro 'rua', complemento 'rua', cep '55365-55', bairro 'bairro' e cidade 'Garanhuns'
    When que eu esteja na tela de paciente
    And seleciono o paciente que quero excluir
    And eu clicar em deletar
    Then o paciente deve ser deletado com sucesso