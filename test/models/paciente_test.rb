require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "tentar salvar paciente sem endereco" do
    paciente = Paciente.new
    paciente.nome = "João da Silva"
    paciente.data_nascimento = "2021-08-12"
    paciente.cpf = "12345678901"
    paciente.email = "joao@gmail.com"

    assert_not paciente.save, "Erro: Endereco nao pode ficar vazio"
  end

  test "salvar paciente sem nome" do
    paciente = Paciente.new
    paciente.nome = ""
    paciente.data_nascimento = "2021-08-12"
    paciente.cpf = "12345678901"
    paciente.email = "teste@teste"


    enderecos = Endereco.new
    enderecos.logradouro = "Rua 1"
    enderecos.complemento = "Casa 1"
    enderecos.cep = "12345678"
    enderecos.bairro = "Centro"
    enderecos.cidade = "São Paulo"

    paciente.endereco = enderecos
    assert_not paciente.save, "Salvou paciente sem nome"
  end
end
