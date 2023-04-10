Given('que estou na pagina de agendamento de consulta') do
  visit '/consultas/new'
end

And('medico de nome {string}, cpf {string}, email {string}, especialidade {string} e crm {string} existe') do |nome, cpf, email, especialidade, crm|
  Medico.create!(nome: nome, cpf: cpf, email: email, especialidade: especialidade, crm: crm)

end

And('paciente de nome {string}, data_nascimento {string}, cpf {string}, email {string}, logradouro {string}, complemento {string}, cep {string}, bairro {string} e cidade {string} existe') do |nome, data_nascimento, cpf, email, logradouro, complemento, cep, bairro, cidade|
  Paciente.create!(nome: nome, data_nascimento: data_nascimento, cpf: cpf, email: email, logradouro: logradouro, complemento: complemento, cep: cep, bairro: bairro, cidade: cidade)
end

When('eu preencho os campos de data {string} e horario {string} e medico {string} e paciente {string}') do |data, horario, medico_nome, paciente_nome|
  medico = Medico.find_by(nome: medico_nome)
  paciente = Paciente.find_by(nome: paciente_nome)
  Consulta.create!(data: data, horario: horario, medico: medico, paciente: paciente)

end

Then('eu vejo a mensagem "Consulta agendada com sucesso"') do
  page.has_content?('Consulta agendada com sucesso')
end

When('que estou na pagina de consulta') do
  visit '/consultas'
end

And('visito a consulta desejada') do
  consulta = Consulta.last
  visit consultas_path(consulta)
end

And('eu clico em editar consulta') do
  click_link "Edit this consulta"
end

And('eu clico em atualizar consulta') do
  click_button 'Update Consulta'
end

Then('eu vejo a mensagem "Consulta editada com sucesso"') do
  page.has_content?('Consulta editada com sucesso')
end

And('preencho os campos que desejo atualizar com todos os dados validos') do
  fill_in 'consulta[horario]', :with => '12:00'
end

Then('eu vejo os dados da consulta') do
  page.has_content?('Consulta')
end