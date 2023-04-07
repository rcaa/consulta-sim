require "test_helper"

class PacienteTest < ActiveSupport::TestCase

  test "Criando conta de paciente sem atributos" do
    paciente = Paciente.new
    assert_not paciente.save
  end


  test "Criando conta de paciente com atributos validos" do
    paciente = Paciente.new nome: 'Gison Vilaca',
                            data_nascimento: "2001-04-25",
                            cpf: '711.785.718-82',
                            email: 'vilaca@gmail.com',
                            endereco_attributes:{
                              logradouro: 'Rua da Escola',
                              complemento: 'Casa',
                              cep: '55290-000',
                              bairro: 'Parque Alvorada',
                              cidade: 'Sao Joao'
    }
    assert paciente.save
  end
end
