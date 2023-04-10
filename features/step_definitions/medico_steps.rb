Given('estou na tela de criar Medico') do
  visit new_medico_path
end

When('eu preencho os campos de nome com {string}, com o CPF {string}, com o email {string}, com a Especialidade {string} e com o CRM {string}') do |nome, cpf, email, especialidade, crm|

  #Preenche os campos"
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm

end

When('clico em Create Medico') do
  click_button 'Create Medico'
end

Then('Eu vejo a pagina do Medico {string}') do |nome|
  # Espero a página do Medico ser carregado
  expect(page).to have_content(nome)
end

Then('Eu vejo a mesagem {string}') do |mensagem|
  # Espero a página do paciente ser carregado
  expect(page).to have_content(mensagem)
end
