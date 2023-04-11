Given('Estou na pagina de cadastrar paciente') do
  visit '/pacientes/new'
  expect(page).to have_content('New paciente')
end

When('eu preencho um paciente de nome: {string}, data_nascimeto: {string}, cpf: {string}, email: {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string},  cidade {string} e clico cadastrar') do |nome, data_nascimeto, cpf, email, logradouro, complemento, cep, bairro, cidade|
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => data_nascimeto
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][logradouro]', with: logradouro
  fill_in 'paciente[endereco_attributes][complemento]', with: complemento
  fill_in 'paciente[endereco_attributes][cep]', with: cep
  fill_in 'paciente[endereco_attributes][bairro]', with: bairro
  fill_in 'paciente[endereco_attributes][cidade]', with: cidade
  click_button 'Create Paciente'
end

Then('vejo  uma mensagem de erro de email invalido') do
  assert_selector('li', text: 'Email is invalid')
end

Then('vejo  uma mensagem de erro de nome invalido') do
  assert_selector('li', text: 'Nome is too short (minimum is 5 characters)')
end