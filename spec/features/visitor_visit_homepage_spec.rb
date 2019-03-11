require 'rails_helper'

def create_employee(name = 'João', role = 'Desenvolvedor', department_name = 'Tecnologia')
  department = Department.create(name: department_name)
  Employee.create(
    name: name,
    role: role,
    department: department,
    admission_date: DateTime.now,
    company: 'Empresa de Desenvolvimento',
    summary: 'Atua diretamente com a equipe de desenvolvimento de software',
    description: 'Simpático, Extrovertido, Disposto a aprender novas tecnologias'
    )
end

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'People Management System')
  end

  scenario 'and view employee' do
    #cria os dados necessários
    employee = create_employee
    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('td', text: employee.name)
    expect(page).to have_css('td', text: employee.role)
    expect(page).to have_css('td', text: employee.department.name)
  end

  scenario 'and view employees list' do
    #cria os dados necessários
    employee = create_employee
    another_employee = create_employee('Rafael', 'Analista Financeiro', 'Financeiro')

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('td', text: employee.name)
    expect(page).to have_css('td', text: employee.role)
    expect(page).to have_css('td', text: employee.department.name)

    expect(page).to have_css('td', text: another_employee.name)
    expect(page).to have_css('td', text: another_employee.role)
    expect(page).to have_css('td', text: another_employee.department.name)
  end
end
