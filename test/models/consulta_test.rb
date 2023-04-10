require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test "Criar Consulta com atributos vazios" do
    consulta = Consulta.new
    assert_not consulta.save
  end

  test "Criar Consulta válidas" do
    paciente = Paciente.new(
      nome: "Elias Lima",
      data_nascimento: "10/10/2010",
      cpf: "70031397158",
      email: "eliaz@gmail.com",
      endereco_attributes:{
        logradouro: "Rua da Liberdade 197",
        complemento: "Casa",
        cep: "55340-000",
        bairro: "São Sebastião",
        cidade: "Águas Belas"
      }
    )
    assert paciente.save

    medico = Medico.new(
      nome:"Dr Pedro Araujo",
      cpf:"68313485728",
      email:"pedro@gmail.com",
      especialidade:"Pediatra",
      crm:"2212"
    )
    assert medico.save


    consulta = Consulta.new(
      data: "10/10/2023",
      horario: "09:00",
      medico_id: medico.id,
      paciente_id: paciente.id
    )
    assert consulta.save
  end

  test "Criar Consulta com data inválida" do
    paciente = Paciente.new(
      nome: "Elias Lima",
      data_nascimento: "10/10/2010",
      cpf: "70031397158",
      email: "eliaz@gmail.com",
      endereco_attributes:{
        logradouro: "Rua da Liberdade 197",
        complemento: "Casa",
        cep: "55340-000",
        bairro: "São Sebastião",
        cidade: "Águas Belas"
      }
    )
    assert paciente.save

    medico = Medico.new(
      nome:"Dr Pedro Araujo",
      cpf:"68313485728",
      email:"pedro@gmail.com",
      especialidade:"Pediatra",
      crm:"2212"
    )
    assert medico.save


    consulta = Consulta.new(
      data: "10/10/2020",
      horario: "09:00",
      medico_id: medico.id,
      paciente_id: paciente.id
    )
    assert_not consulta.save
  end
end
