require "test_helper"

class MedicoTest < ActiveSupport::TestCase

  test 'Criando conta de medico com cpf invalido' do
    medico = Medico.new nome: 'Doutor',
                        cpf: '706.508.980-00',
                        email: 'doutor@gmail.com',
                        especialidade: 'Cardiologista',
                        crm: '123456'
    assert_not medico.save
  end

  test 'Criando conta de medico com crm invalido' do
    medico = Medico.new nome: 'Doutor',
                        cpf: '706.508.980-01',
                        email: 'doutor@gmail.com',
                        especialidade: 'Cardiologista',
                        crm: 'A23456'
    assert_not medico.save
  end

end
