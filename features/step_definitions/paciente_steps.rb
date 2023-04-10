Given('que eu esteja na tela de cadastro de paciente') do
  visit '/pacientes/new'
end

When('eu preencho os campos nome {string}, data_nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string} e cidade {string}') do |nome, data, cpf, email, rua, comp, cep, bairro, cidade|
  fill_in 'paciente[nome]', with: nome
  fill_in 'paciente[data_nascimento]', with: data
  fill_in 'paciente[cpf]', with: cpf
  fill_in 'paciente[email]', with: email
  fill_in 'paciente[endereco_attributes][logradouro]', with: rua
  fill_in 'paciente[endereco_attributes][complemento]', with: comp
  fill_in 'paciente[endereco_attributes][cep]', with: cep
  fill_in 'paciente[endereco_attributes][bairro]', with: bairro
  fill_in 'paciente[endereco_attributes][cidade]', with: cidade
end

When('eu clicar em salvar') do
  click_button 'Create Paciente'
end

Then('o paciente deve ser cadastrado com sucesso') do
  page.has_content? ('Paciente was successfully created.')
end

Given('paciente de nome {string}, data_nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string} e cidade {string}') do |nome, data_nascimento, cpf, email, logradouro, complemento, cep, bairro, cidade|
  Paciente.create!(nome: nome, data_nascimento: data_nascimento, cpf: cpf, email: email, endereco_attributes: {logradouro: logradouro, complemento: complemento, cep: cep, bairro: bairro, cidade: cidade})
end

When('que eu esteja na tela de pacient') do
  visit '/pacientes'
  expect(page).to have_content('Pacientes')
end

And('seleciono o paciente que quero excluir') do
  paciente = Paciente.last
  visit paciente_path(paciente)
end

And('eu clicar em deletar') do
  click_button 'Destroy this paciente'
end

Then('o paciente deve ser deletado com sucesso') do
  page.has_content? ('Paciente was successfully destroyed.')
end