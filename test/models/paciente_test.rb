require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'Conta paciente válida' do
    paciente = Paciente.new nome: 'rogerio',
                            data_nascimento: '20/03/2000',
                            cpf: '12015559493',
                            email: 'paciente@teste.com',
                            endereco_attributes:{
                              logradouro: 'Rua teste',
                              complemento: 'apto 08',
                              cep: '55022-220',
                              bairro: 'rendeiras',
                              cidade: 'caruaru'
                            }
    assert_not paciente.save

  end

  test 'Conta paciente sem cpf' do
    paciente = Paciente.new nome: 'rogerio',
                            data_nascimento: '20/03/2000',
                            cpf: '',
                            email: 'paciente@teste.com',
                            endereco_attributes:{
                              logradouro: 'Rua teste',
                              complemento: 'apto 08',
                              cep: '55022-220',
                              bairro: 'rendeiras',
                              cidade: 'caruaru'
                            }
    assert_not paciente.save
  end
end