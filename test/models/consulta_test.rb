require "test_helper"

class ConsultaTest < ActiveSupport::TestCase
  #Para validar que a data da consulta nao pode ser no passado
  test 'data_consulta_futuro deve adicionar erro se a data estiver no passado' do
    consulta = Consulta.new(data: Date.today - 1.day, horario: '08:00', medico: medico, paciente: paciente)
    consulta.validate
    assert_includes consulta.errors.details[:data], { error: :data_consulta_futuro }
  end
  test 'data_consulta_futuro nao deve adicionar erro se a data estiver no futuro' do
    consulta = Consulta.new(data: Date.today + 1.day, horario: '08:00', medico: medico, paciente: paciente)
    consulta.validate
    assert_not_includes consulta.errors.details[:data], { error: :data_consulta_futuro }
  end

  #Para validar que o horario da consulta eh valido:
  test 'horarios_validos deve adicionar erro se o horario for invalido' do
    consulta = Consulta.new(data: Date.today + 1.day, horario: '07:00', medico: medico, paciente: paciente)
    consulta.validate
    assert_includes consulta.errors.details[:horario], { error: :horarios_validos }
  end
  test 'horarios_validos nao deve adicionar erro se o horario for valido' do
    consulta = Consulta.new(data: Date.today + 1.day, horario: '08:00', medico: medico, paciente: paciente)
    consulta.validate
    assert_not_includes consulta.errors.details[:horario], { error: :horarios_validos }
  end

end
