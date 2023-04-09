require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test "Consulta válida" do
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
    assert paciente.save

    medico = Medico.new nome: 'Dr teste',
                        cpf: '01802157018',
                        email: 'dr@teste',
                        especialidade: 'testador',
                        crm: '12345'
    assert medico.save

    consulta = Consulta.new data: '20/04/2023',
                            horario: '08:00',
                            medico_id: medico.id,
                            paciente_id: paciente.id
    assert consulta.save()
  end

  test 'Consulta sem paciente' do
    paciente = Paciente.new nome: 'rogerio dois',
                            data_nascimento: '20/03/2000',
                            cpf: '',
                            email: 'paciente2@teste.com',
                            endereco_attributes:{
                              logradouro: 'Rua teste dois',
                              complemento: 'apto 09',
                              cep: '55022-220',
                              bairro: 'rendeiras',
                              cidade: 'caruaru'
                            }
    assert paciente.save


    medico = Medico.new nome: 'Dr teste',
                        cpf: '01802157018',
                        email: 'dr@teste',
                        especialidade: 'testador',
                        crm: '12345'
    assert_not medico.save

    consulta = Consulta.new(data: '20/04/2023',
                            horario: '08:00',
                            medico_id: medico.id,
                            paciente_id: paciente.id)
    assert_not consulta.save()
  end
end
