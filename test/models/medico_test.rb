require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  #Para validar que o nome do medico eh obrigatorio e tem tamanho entre 5 e 40 caracteres
  test 'nome deve estar presente e ter tamanho entre 5 e 40 caracteres' do
    medico = Medico.new(nome: 'Jose', cpf: '12345678901', email: 'jose@example.com', especialidade: 'Oftalmologia', crm: 12345)
    assert_not medico.valid?
    assert_includes medico.errors.details[:nome], { error: :blank }

    medico.nome = 'Jose da Silva Oliveira Santos'
    assert medico.valid?
    assert_empty medico.errors.details[:nome]
  end

  #Para validar que o CPF do medico eh valido
  test 'cpf deve estar presente e ser válido' do
    medico = Medico.new(nome: 'João', cpf: '123.456.789-01', email: 'joao@example.com', especialidade: 'Oftalmologia', crm: 12345)
    assert_not medico.valid?
    assert_includes medico.errors.details[:cpf], { error: :cpf_valido }

    medico.cpf = '12345678901'
    assert medico.valid?
    assert_empty medico.errors.details[:cpf]
  end
end
