require "cpf_cnpj"

class Medico < ApplicationRecord

  has_many :consultas
  has_many :pacientes, through: :consultas

  validates :nome, presence: true, length: {in: 5..40}
  validate :cpf_valido
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :especialidade, presence: true, length: {in: 4..20}
  validates :crm, presence: true, length: {in: 4..10}, numericality: {only_integer: true}

  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "formato ou numero errado")
    end
  end
end
