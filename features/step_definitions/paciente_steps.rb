Given('que eu esteja na tela de cadastro de paciente') do
  visit '/pacientes/new'
  expect(page).to have_content('New paciente')
end

When('eu preencho os campos nome {string}, data_nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string} e cidade {string}') do |string, string2, string3, string4, string5, string7, string8, string9, string10|
  fill_in 'paciente[nome]', with: string
  fill_in 'paciente[data_nascimento]', with: string2
  fill_in 'paciente[cpf]', with: string3
  fill_in 'paciente[email]', with: string4
  fill_in 'paciente[endereco_attributes][logradouro]', with: string5
  fill_in 'paciente[endereco_attributes][complemento]', with: string7
  fill_in 'paciente[endereco_attributes][cep]', with: string8
  fill_in 'paciente[endereco_attributes][bairro]', with: string9
  fill_in 'paciente[endereco_attributes][cidade]', with: string10
end

When('eu clicar em salvar') do
  click_button 'Create Paciente'
end

Then('o paciente deve ser cadastrado com sucesso') do
  page.has_content?('Paciente was successfully created.')
end

Given('paciente de nome {string}, data_nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string} e cidade {string}') do |nome, data_nascimento, cpf, email, logradouro, complemento, cep, bairro, cidade|
  Paciente.create!(nome: nome, data_nascimento: data_nascimento, cpf: cpf, email: email, endereco_attributes: {logradouro: logradouro, complemento: complemento, cep: cep, bairro: bairro, cidade: cidade})
end

When(/^que eu esteja na tela de paciente$/) do
  visit '/pacientes'
  expect(page).to have_content('Pacientes')
end

And(/^seleciono o paciente que quero excluir$/) do
  paciente = Paciente.last
  visit paciente_path(paciente)
end

And(/^eu clicar em deletar$/) do
  click_button 'Destroy this paciente'
end

Then(/^o paciente deve ser deletado com sucesso$/) do
  page.has_content?('Paciente was successfully destroyed.')
end