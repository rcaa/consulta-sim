# AGENDAR CORRETAMENTE
Given('estou na tela de agendar nova consulta') do
  visit 'pacientes/new'
  fill_in 'paciente[nome]', with: 'G Vilaca'
  fill_in 'paciente[data_nascimento]', with: "2001-04-25"
  fill_in 'paciente[cpf]', with: '188.037.351-35'
  fill_in 'paciente[email]', with: 'gison@gmail.com'
  fill_in 'paciente[endereco_attributes][logradouro]', with: 'Rua do Educandario'
  fill_in 'paciente[endereco_attributes][complemento]', with: 'Casa'
  fill_in 'paciente[endereco_attributes][cep]', with: '55435-000'
  fill_in 'paciente[endereco_attributes][bairro]', with: 'Parque Alvorada'
  fill_in 'paciente[endereco_attributes][cidade]', with: 'Sao Joao'
  click_button 'Create Paciente'

  visit 'medicos/new'
  fill_in 'medico[nome]', with: 'Gison V M'
  fill_in 'medico[cpf]', with: '729.437.510-06'
  fill_in 'medico[email]', with: 'doutor@gmail.com'
  fill_in 'medico[especialidade]', with: 'cirurgiao'
  fill_in 'medico[crm]', with: '223456'
  click_button 'Create Medico'

  visit 'consultas/new'
end

When('seleciono a data {string}, as {string} horas') do |data, horario|
  fill_in 'consulta[data]', with: data
  select horario
end

When('eu seleciono o paciente de nome {string}, nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string},  cidade {string}') do |nome, nascimento, cpf, email, logradouro, complemento, cep, bairro, cidade|
  select 'G Vilaca', from: 'consulta[paciente_id]'
end

When('seleciono o medico de nome {string}, cpf {string}, email {string}, especialidade {string}, crm {string}') do |nome, cpf, email, especialidade, crm|
  select 'Gison V M', from: 'consulta[medico_id]'
end

When('clico em Criar Consulta') do
  click_button 'Create Consulta'
end

Then('eu vejo a mensagem de que a consulta foi agendada com sucesso') do
  expect(page).to have_content('Consulta was successfully created.')
end


# DATA ANTIGA
Then('eu vejo a mensagem de erro informando que data ja passou') do

end