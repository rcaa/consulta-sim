# DATA DE NASCIMENTO INVALIDA
Given('estou na tela de criar conta de paciente') do
  visit 'pacientes/new'
end

When('eu preencho os campos com nome {string}, nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string},  cidade {string}') do |nome, nascimento, cpf, email, logradouro, complemento, cep, bairro, cidade|
  fill_in 'paciente[nome]', with: nome
  fill_in 'paciente[data_nascimento]', with: nascimento
  fill_in 'paciente[cpf]', with: cpf
  fill_in 'paciente[email]', with: email
  fill_in 'paciente[endereco_attributes][logradouro]', with: logradouro
  fill_in 'paciente[endereco_attributes][complemento]', with: complemento
  fill_in 'paciente[endereco_attributes][cep]', with: cep
  fill_in 'paciente[endereco_attributes][bairro]', with: bairro
  fill_in 'paciente[endereco_attributes][cidade]', with: cidade
end

When('eu clico em Criar Paciente') do
  click_button 'Create Paciente'
end

Then('vejo uma mensagem de erro informando data de nascimento invalida') do
  expect(page).to have_content('1 error prohibited this paciente from being saved:')
end


# CRIANDO CONTA CORRETAMENTE
Then('vejo uma mensagem informando que a conta de Paciente foi criada com sucesso') do
  expect(page).to have_content('Paciente was successfully created.')
end
