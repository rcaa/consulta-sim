require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test 'Criando Consulta corretamente' do
    medico = Medico.new nome: 'Rian Wilker Santos',
                        cpf: '11698885826',
                        email: 'rian@gmail.com',
                        especialidade: 'Pediatra',
                        crm: '000000'
    assert medico.save

    paciente = Paciente.new
    paciente.nome = "Maria Lyvia Farias de Santana"
    paciente.data_nascimento = "25/03/2003"
    paciente.cpf = "11698885826"
    paciente.email = "test@gmail.com"

    enderecos = Endereco.new
    enderecos.logradouro = "Rua"
    enderecos.complemento = "Posto"
    enderecos.cep = "55365000"
    enderecos.bairro = "Centro"
    enderecos.cidade = "Garanhuns"

    paciente.endereco = enderecos
    assert paciente.save

    consulta = Consulta.new data: '15/05/2023',
                            horario:'15:00',
                            paciente_id: paciente.id,
                            medico_id: medico.id
    assert consulta.save
  end


  test 'Criando sem medico' do
    paciente = Paciente.new
    paciente.nome = "Maria Lyvia Farias de Santana"
    paciente.data_nascimento = "25/03/2003"
    paciente.cpf = "11698885826"
    paciente.email = "test@gmail.com"

    enderecos = Endereco.new
    enderecos.logradouro = "Rua"
    enderecos.complemento = "Posto"
    enderecos.cep = "55365000"
    enderecos.bairro = "Centro"
    enderecos.cidade = "Garanhuns"

    paciente.endereco = enderecos
    assert paciente.save

    consulta = Consulta.new data: '15/05/2023',
                            horario:'16:00',
                            paciente_id: paciente.id


    assert_not consulta.save, "consulta sem medico"
  end
end
