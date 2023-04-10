require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "Nome deve estar presente" do
    paciente = Paciente.new(nome: "")
    assert_not paciente.valid?
    assert_equal ["nao pode ficar em branco"], paciente.errors[:nome]
  end
  test "CPF deve ser valido" do
    paciente = Paciente.new(cpf: "123456789000")
    assert_not paciente.valid?
    assert_equal ["formato ou numero errado"], paciente.errors[:cpf]
  end
end
