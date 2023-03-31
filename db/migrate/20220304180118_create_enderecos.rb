class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :complemento
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
