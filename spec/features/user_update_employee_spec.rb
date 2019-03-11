require 'rails_helper'

def create_employee
  department = Department.create(name: 'Tecnologia')
  employee = Employee.create(
    name: 'João',
    role: 'Desenvolvedor',
    department: department,
    admission_date: DateTime.now,
    company: 'Empresa de Desenvolvimento',
    summary: 'Atua diretamente com a equipe de desenvolvimento de software',
    description: 'Simpático, Extrovertido, Disposto a aprender novas tecnologias'
    )
end

feature 'User update recipe' do
  scenario 'successfully' do
    employee = create_employee

    # simula a ação do usuário
    visit employee_path(employee)
    click_on 'Update Employee'
    fill_in 'Name', with: 'Maria'
    click_on 'Update'

    expect(current_path).to eq(employee_path(employee))
    expect(page).to have_css('h2', text: 'Employee Information')
    expect(page).to have_css('div.employee-name', text: 'Maria')
    expect(page).not_to have_css('div.employee-name', text: 'João')
  end

  scenario 'and must fill in all fields' do
    employee = create_employee

    # simula a ação do usuário
    visit employee_path(employee)
    click_on 'Update Employee'
    fill_in 'Name', with: ''
    click_on 'Update'

    expect(page).to have_content('You need to fill in the fields !')
  end
end