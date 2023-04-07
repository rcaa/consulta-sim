require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'criando medico corretamente' do
    medico = Medico.new nome: 'Rodrigo',
                        cpf: '68551863940',
                        email: 'rodrigo@rodrigo.com',
                        especialidade: 'Cardiologista',
                        crm: '123456'
    assert medico.save
  end

  test 'excluindo medico corretamente' do
    medico = Medico.new nome: 'Rodrigo Leandro',
                        cpf: '08283544217',
                        email: 'rodrigo@gmail.com',
                        especialidade: 'Reumatologista',
                        crm: '123456'
    assert medico.save
    assert medico.destroy
  end
end
