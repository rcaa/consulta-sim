require "test_helper"

class PacienteTest < ActiveSupport::TestCase
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
  test "Criar paciente sem cpf" do
    paciente = Paciente.new
    paciente.nome = "Rian Wilker Santos Melo"
    paciente.data_nascimento = "20/11/2001"
    paciente.cpf = ""
    paciente.email = "teste@gmail.com"

    enderecos = Endereco.new
    enderecos.logradouro = "Rua"
    enderecos.complemento = "Rua da caixa"
    enderecos.cep = "55365000"
    enderecos.bairro = "Centro"
    enderecos.cidade = "Capoeiras"

    paciente.endereco = enderecos
    assert_not paciente.save, "paciente sem CPF"
  end
end
