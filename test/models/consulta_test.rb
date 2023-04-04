require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  test "criar consulta sem paciente" do
    consultas = Consulta.new
    consultas.medico_id = 1
    consultas.data = "2018-10-10"
    consultas.horario = "10:00"
    assert_not consultas.save, "Salvou consulta sem paciente"
  end

  test "criar consulta sem medico" do
    consultas = Consulta.new
    consultas.paciente_id = 1
    consultas.data = "2018-10-10"
    consultas.horario = "10:00"
    assert_not consultas.save, "Salvou consulta sem medico"
  end
end
