require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test "Salvar consulta corretamente" do
    medico = Medico.new nome:"Ricardo",
              cpf:"12245122437",
              email:"ricardo@gmail.com",
              especialidade:"cardiologista",
              crm:"123456"
    assert medico.save

    paciente = Paciente.new nome: 'Rodrigo',
                cpf:"44122399696",
                email: "rodrigo@gmail.com",
                data_nascimento: "2002-06-05",
                endereco_attributes:{ cep: "55298-165",
                logradouro: "rua do zekinha",
                cidade: 'Garanhuns',
                bairro: "Heliopolis",
                complemento: 'posto'
                }
    assert paciente.save

    consulta = Consulta.new data: '2023-05-05',
                horario:'14:00',
                paciente_id: paciente.id,
                medico_id: medico.id
    assert consulta.save
  end


  test "atualizar consulta corretamente" do
    medico = Medico.new nome:"Ricardo",
              cpf:"12245122437",
              email:"ricardo@gmail.com",
              especialidade:"cardiologista",
              crm:"123456"
    assert medico.save

    paciente = Paciente.new nome: 'Rodrigo',
                cpf:"44122399696",
                email: "rodrigo@gmail.com",
                data_nascimento: "2002-06-05",
                endereco_attributes:{ cep: "55298-165",
                logradouro: "rua do zekinha",
                cidade: 'Garanhuns',
                bairro: "Heliopolis",
                complemento: 'posto'
                }
    assert paciente.save

    consulta = Consulta.new data: '2023-05-05',
                horario:'11:00',
                paciente_id: paciente.id,
                medico_id: medico.id
    assert consulta.save
    assert consulta.update horario:'08:00'
  end
end
