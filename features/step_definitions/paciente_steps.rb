Given('estou na tela de criar Paciente') do
  visit new_paciente_path
end

When('eu preencho os campos de Nome com {string}, com a data {string}, com o CPF {string}, com o email {string}, com o CEP {string}, com a cidade {string}, com o bairro {string}, com o logradouro {string} e com o completo {string}') do |nome, data, cpf, email, cep, cidade, bairro, logradouro, complemento|

  #Preenche os campos"
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => data
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
end

When('clico em Create Paciente') do
  click_button 'Create Paciente'
end

Then('Eu vejo a pagina do paciente {string}') do |nome|
  # Espero a página do paciente ser carregado
  expect(page).to have_content(nome)
end

When('eu preencho os campos de nome vazio {string}, com a data {string}, com o CPF {string}, com o email {string}, com o CEP {string}, com a cidade {string}, com o bairro {string}, com o logradouro {string} e com o completo {string}') do |nome, data, cpf, email, cep, cidade, bairro, logradouro, complemento|

  #Preenche os campos"
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[data_nascimento]', :with => data
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
end