Given('eu estou na pagina de paciente') do
  visit 'pacientes/new'
end

Given('eu vejo um paciente com cpf {string}') do |cpf|
  fill_in 'paciente[nome]', with: 'Rodrigo'
  fill_in 'paciente[cpf]', with: cpf
  fill_in 'paciente[email]', with: 'rodrigo@gmail.com'
  fill_in 'paciente[data_nascimento]', with: '2000-05-06'
  fill_in 'paciente[endereco_attributes][cep]', with: '55298-165'
  fill_in 'paciente[endereco_attributes][logradouro]', with: 'rua do zekinha'
  fill_in 'paciente[endereco_attributes][cidade]', with: 'Garanhuns'
  fill_in 'paciente[endereco_attributes][bairro]', with: 'Heliopolis'
  fill_in 'paciente[endereco_attributes][complemento]', with: 'posto'
  click_button 'Create Paciente'
  expect(page).to have_content(cpf)
end

When('eu clico em remover o paciente') do
  click_button 'Destroy this paciente'
end

Then('eu vejo uma mensagem que o paciente com cpf {string} foi removido') do |cpf|
  expect(page).to have_content('Paciente was successfully destroyed.')
  expect(page).to have_no_content(cpf)
end

When('eu preecho o nome {string}, cpf {string},email {string}, data_de_nascimento {string}, cep {string}, logradouro {string},cidade {string},bairro {string} e complemento {string}') do |nome, cpf, email, data_nascimento, cep, logradouro, cidade, bairro, complemento|
  fill_in 'paciente[nome]', with: nome
  fill_in 'paciente[cpf]', with: cpf
  fill_in 'paciente[email]', with: email
  fill_in 'paciente[data_nascimento]', with: data_nascimento
  fill_in 'paciente[endereco_attributes][cep]', with: cep
  fill_in 'paciente[endereco_attributes][logradouro]', with: logradouro
  fill_in 'paciente[endereco_attributes][cidade]', with: cidade
  fill_in 'paciente[endereco_attributes][bairro]', with: bairro
  fill_in 'paciente[endereco_attributes][complemento]', with: complemento
end

When('clico em criar paciente') do
  click_button 'Create Paciente'
end

Then('Eu vejo uma mensagem de paciente invalido') do
  expect(page).to have_content('13 errors prohibited this paciente from being saved:')
end
