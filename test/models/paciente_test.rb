require "test_helper"

class PacienteTest < ActiveSupport::TestCase

  test "Criar conta de paciente sem atributos" do
    paciente = Paciente.new
    assert_not paciente.save
  end

  test "criar paciente válido" do
    paciente = Paciente.new(
      nome: "Elias Lima",
      data_nascimento: "10/10/2010",
      cpf: "58525111880",
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
  end

  test "criar paciente com cpf inválido" do
    paciente = Paciente.new(
      nome: "Elias Lima",
      data_nascimento: "10/10/2010",
      cpf: "11122211122",
      email: "eliaz@gmail.com",
      endereco_attributes:{
        logradouro: "Rua da Liberdade 197",
        complemento: "Casa",
        cep: "55340-000",
        bairro: "São Sebastião",
        cidade: "Águas Belas"
      }
    )
    assert_not paciente.save
  end
end
