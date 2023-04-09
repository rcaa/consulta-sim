require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'Conta medico com CRM vazio' do
    medico = Medico.new nome: 'dr teste',
                        cpf: '12015559493',
                        email: 'dr@teste.com',
                        especialidade: 'testador',
                        crm: ''
    assert_not medico.save
  end

  test 'Criando conta de medico com email vazio' do
    medico = Medico.new nome: 'dr teste',
                        cpf: '12015559493',
                        email: '',
                        especialidade: 'testador',
                        crm: '12345'
    assert_not medico.save
  end
end
