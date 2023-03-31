class Endereco < ApplicationRecord

  belongs_to :paciente

  validates :logradouro, presence: true, length: {in: 4..30}
  validates :complemento, length: {in: 2..10}
  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true,
                      message: 'deve ter formato XXXXX-XXX'
  validates :bairro, presence: true, length: {in: 2..20}
  validates :cidade, presence: true, length: {in: 2..20}
end
