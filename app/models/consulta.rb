class Consulta < ApplicationRecord

  belongs_to :medico
  belongs_to :paciente

  validates :data, presence: true
  validates :horario, presence: true, uniqueness: true

  validate :data_consulta_futuro
  def data_consulta_futuro
    if data.present? && data < Date.today
      errors.add(:dataConsulta, "nao pode ser no passado")
    end
  end

  validate :horarios_validos
  def horarios_validos
    if %w[08:00 09:00 10:00 11:00 14:00 15:00 16:00 17:00].exclude? horario
      errors.add(:horarioConsulta, "horario invalido")
    end
  end
end