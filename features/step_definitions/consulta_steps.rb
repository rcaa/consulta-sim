Given("estou na tela da consulta que sera excluida") do
  @consulta = Consulta.create!(data: "2023-04-26", horario: "14:00", paciente: "João Paulo", medico: "Dra Roberto")
  visit edit_consulta_path(@consulta)
end

And("clico em Deletar consulta") do
  click_link "Destroy this consulta"
end

Then("Eu vejo a pagina da 'Consulta'") do
  expect(page).to have_current_path(consultas_path)
end

Given("estou na tela da consulta que sera editada") do
  @consulta = Consulta.create!(data: "2023-04-26", horario: "14:00", paciente: "João Paulo", medico: "Dra Roberto")
  visit edit_consulta_path(@consulta)
end

And("clico em Update Consulta") do
  click_button "Update Consulta"
end

Then("Eu vejo a mensagem 'Consulta was successfully updated'") do
  expect(page).to have_content("Consulta was successfully updated.")
end

