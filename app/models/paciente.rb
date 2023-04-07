require "cpf_cnpj"

class Paciente < ApplicationRecord

  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  has_many :consultas, dependent: :destroy
  has_many :medicos, through: :consultas

  validates :nome, presence: true, length: {in: 5..40}
  validates :data_nascimento, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :data_nascimento_valida
  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Time.zone.today
      errors.add(:data, "nao pode ser no futuro")
    end
  end

  validate :cpf_valido
  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "formato ou numero errado")
    end
  end
end
