require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "Salvar o paciente sem atributos" do
    @paciente = Paciente.new
    assert_not @paciente.save
  end

  test "Salvar paciente com todos os atributos validos" do
    paciente = Paciente.new nome: 'Rodrigo',
               cpf:'70383167450',
               email: "rodrigo@gmail.com",
               data_nascimento: "2002-06-05",
               endereco_attributes:{ cep: "55298-165",
               logradouro: "rua do zekinha",
               cidade: 'Garanhuns',
               bairro: "Heliopolis",
               complemento: 'posto',
               }
    assert paciente.save
  end
end
