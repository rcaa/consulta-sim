require "test_helper"

class MedicoTest < ActiveSupport::TestCase

  test "Criar medico sem atributos" do
    medico = Medico.new
    assert_not medico.save
  end

  test "criar medico" do
    medico = Medico.new(
      nome:"Dr Pedro Araujo",
      cpf:"58525111880",
      email:"pedro@gmail.com",
      especialidade:"Pediatra",
      crm:"2212"
    )
    assert medico.save
  end

  test "criar medico com nome invalido" do
    medico = Medico.new(
      nome:"",
      cpf:"11513735403",
      email:"pedro@gmail.com",
      especialidade:"Pediatra",
      crm:"2212"
    )
    assert_not medico.save
  end
end
