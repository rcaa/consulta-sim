Given('eu estou na pagina de criar consulta') do
  visit 'consultas/new'
end

When('eu preencho os campos data {string}, horario {string},paciente {string} ,medico {string}') do |data, horario, paciente, medico|
  @medico = Medico.new nome: medico, cpf: '08283544217', email: 'rodrigo@gmail.com', especialidade: 'Reumatologista', crm: '123456'
  @medico.save
  visit 'medicos'
  expect(page).to have_content(medico)

  @paciente = Paciente.new nome: paciente, cpf:'70383167450', email: "rodrigo@gmail.com", data_nascimento: "2002-06-05", endereco_attributes:{ cep: "55298-165", logradouro: "rua do zekinha", cidade: 'Garanhuns', bairro: "Heliopolis", complemento: 'posto', }
  @paciente.save
  visit 'pacientes'
  expect(page).to have_content(paciente)

  visit 'consultas/new'
  fill_in 'consulta[data]', with: data
  select horario, from: 'consulta[horario]'
  select paciente, from: 'consulta[paciente_id]'
  select medico, from: 'consulta[medico_id]'
end

When('eu clico em cadastrar nova consulta') do
  click_button 'Create Consulta'
end

Then('eu vejo uma mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end
