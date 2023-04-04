require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'criando medico corretamente' do
    medico = Medico.new nome: 'Rodrigo Andrade', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Reumatologista', crm: '123456'
    assert medico.save
  end

  test 'criando medico sem nome' do
    medico = Medico.new nome: '', cpf: '706.508.980-01', email: 'rodrigo@rodrigo.com',
                        especialidade: 'Neurologista', crm: '123456'
    assert_not medico.save, 'Medico salvo sem nome'
  end

  test 'criando medico sem cpf' do
    medico = Medico.new nome: 'Luiz Fellipe', cpf: '', email: 'luiz@luiz.com',
                        especialidade: 'Cardiologista', crm: '123456'
    assert medico.save
  end
end
