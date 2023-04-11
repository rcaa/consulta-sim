Given('Estou na pagina de cadastrar consulta') do
  visit 'pacientes/new'
  fill_in 'paciente[nome]', with: 'teste'
  fill_in 'paciente[data_nascimento]', with: "2000-03-20"
  fill_in 'paciente[cpf]', with: '12015559493'
  fill_in 'paciente[email]', with: 'teste@gmail.com'
  fill_in 'paciente[endereco_attributes][logradouro]', with: 'av caruaru'
  fill_in 'paciente[endereco_attributes][complemento]', with: 'ap 07'
  fill_in 'paciente[endereco_attributes][cep]', with: '55022-220'
  fill_in 'paciente[endereco_attributes][bairro]', with: 'rendeiras'
  fill_in 'paciente[endereco_attributes][cidade]', with: 'caruaru'
  click_button 'Create Paciente'

  visit 'medicos/new'
  fill_in 'medico[nome]', with: 'dr teste'
  fill_in 'medico[cpf]', with: '12015559492'
  fill_in 'medico[email]', with: 'teste@doutor.com'
  fill_in 'medico[especialidade]', with: 'testador'
  fill_in 'medico[crm]', with: '12345'
  click_button 'Create Medico'

  visit 'consultas/new'
end

When('eu preencho a data {string}, e horario {string}') do |data, horario|
  fill_in 'consulta[data]', with: data
  select horario
end

And('seleciono o paciente de nome {string}') do |nome|
  select 'teste', from: 'consulta[paciente_id]'
end

And('seleciono o medico de nome {string} e clico Criar consulta') do |nome|
  select 'dr teste', from: 'consulta[medico_id]'
  click_button 'Create Consulta'
end

Then('vejo  uma mensagem de erro de data invalida') do
  assert_selector('li', text: 'Dataconsulta nao pode ser no passado')
end

Then('eu vejo a mensagem de que a consulta foi agendada com sucesso') do
  expect(page).to have_content('Consulta was successfully created.')
end