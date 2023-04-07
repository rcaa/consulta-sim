require "test_helper"

class ConsultaTest < ActiveSupport::TestCase

  test 'Criando consulta valida' do
    paciente = Paciente.new nome: 'Gison Morais',
                            data_nascimento: "2001-04-25",
                            cpf: '332.551.379-42',
                            email: 'vilaca@gmail.com',
                            endereco_attributes:{
                              logradouro: 'Rua da Escola',
                              complemento: 'Casa',
                              cep: '55290-000',
                              bairro: 'Parque Alvorada',
                              cidade: 'Sao Joao'
                            }
    assert paciente.save

    medico = Medico.new nome: 'Dr Silva',
                        cpf: '727.186.164-58',
                        email: 'doutor@gmail.com',
                        especialidade: 'Dermatologista',
                        crm: '123446'
    assert medico.save

    consulta = Consulta.new(data:"06/11/2023", horario:"09:00", paciente_id:paciente.id, medico_id:medico.id)
    assert consulta.save
  end

  test 'Criando consulta com horario invalido' do
    paciente = Paciente.new nome: 'Gison',
                            data_nascimento: "2001-04-25",
                            cpf: '466.763.691-25',
                            email: 'vilaca@gmail.com',
                            endereco_attributes:{
                              logradouro: 'Rua da Escola',
                              complemento: 'Casa',
                              cep: '55290-000',
                              bairro: 'Parque Alvorada',
                              cidade: 'Sao Joao'
                            }
    assert paciente.save

    medico = Medico.new nome: 'Dr Vilaca',
                        cpf: '588.146.497-40',
                        email: 'doutor@gmail.com',
                        especialidade: 'Pneumologista',
                        crm: '123556'
    assert medico.save

    consulta = Consulta.new(data:"06/11/2023", horario:"06:00", paciente_id:paciente.id, medico_id:medico.id)
    assert_not consulta.save
  end

end
