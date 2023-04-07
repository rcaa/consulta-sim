class Consulta < ApplicationRecord

  belongs_to :medico
  belongs_to :paciente

  validates :data_consulta_futuro, presence: true
  validate :horarios_validos, presence: true, uniqueness: true

  def data_consulta_futuro
    if data.present? && data < Date.today
      errors.add(:data, "nao pode ser no passado")
    end
  end

  def horarios_validos
    if %w[08:00 09:00 10:00 11:00 14:00 15:00 16:00 17:00].exclude? horario
      errors.add(:horario, "horario invalido")
    end
  end
end
