require 'rails_helper'

def create_employee
  department = Department.create(name: 'Tecnologia')
  Employee.create(
    name: 'João',
    role: 'Desenvolvedor',
    department: department,
    admission_date: DateTime.now,
    company: 'Empresa de Desenvolvimento',
    summary: 'Atua diretamente com a equipe de desenvolvimento de software',
    description: 'Simpático, Extrovertido, Disposto a aprender novas tecnologias'
    )
end

feature 'Visitor view employee details' do
  scenario 'successfully' do
    #cria os dados necessários
    employee = create_employee

    # simula a ação do usuário
    visit employee_path(employee)

    # expectativas do usuário após a ação
    expect(page).to have_css('h2', text: 'Employee Information')
    expect(page).to have_css('div.employee-name', text: employee.name)
    expect(page).to have_css('div.employee-company', text: employee.company)
    expect(page).to have_css('div.employee-summary', text: employee.summary)
    expect(page).to have_css('div.employee-role', text: employee.role)
    expect(page).to have_css('div.employee-department', text: employee.department.name)
    expect(page).to have_css('div.employee-admission', text: employee.admission_date.strftime("%d/%m/%Y"))
    expect(page).to have_css('div.employee-company', text: employee.company)
    expect(page).to have_css('div.employee-description', text: employee.description)
  end

  scenario 'and view return button' do
    #cria os dados necessários
    employee = create_employee

    # simula a ação do usuário
    visit employee_path(employee)

    # expectativa da rota atual
    expect(page).to have_link('Back')
  end

  scenario 'and return to employees list' do
    #cria os dados necessários
    employee = create_employee

    # simula a ação do usuário
    visit employee_path(employee)
    click_on 'Back'

    # expectativa da rota atual
    expect(current_path).to eq(root_path)
  end
end
