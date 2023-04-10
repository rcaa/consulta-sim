require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'Criando medico corretamente' do
    medico = Medico.new nome: 'Rian Wilker Santos',
                        cpf: '11698885826',
                        email: 'rian@gmail.com',
                        especialidade: 'Pediatra',
                        crm: '000000'
    assert medico.save
  end

  test 'Criando sem CPF' do
    medico = Medico.new nome: 'Rian Wilker Santos',
                        cpf: '',
                        email: 'rian@gmail.com',
                        especialidade: 'Pediatra',
                        crm: '000000'
    assert_not medico.save, 'Medico sem CPF'
  end
end
