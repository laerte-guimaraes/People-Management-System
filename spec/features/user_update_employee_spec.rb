require 'rails_helper'

feature 'User update recipe' do
  scenario 'successfully' do
    employee = Employee.create(
      name: 'João',
      role: 'Desenvolvedor',
      department: 'Tecnologia',
      admission_date: DateTime.now,
      company: 'Empresa de Desenvolvimento',
      summary: 'Atua diretamente com a equipe de desenvolvimento de software',
      description: 'Simpático, Extrovertido, Disposto a aprender novas tecnologias'
      )
    # simula a ação do usuário
    visit employee_path(employee)
    click_on 'Update Employee'
    fill_in 'Name', with: 'Maria'
    click_on 'Update'

    expect(page).to have_css('h2', text: 'Employee Information')
    expect(page).to have_css('div.employee-name', text: 'Maria')
    expect(page).not_to have_css('div.employee-name', text: 'João')
  end
end