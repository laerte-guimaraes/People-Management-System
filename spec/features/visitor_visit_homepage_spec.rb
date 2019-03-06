require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'People Management System')
  end

  scenario 'and view employee' do
    #cria os dados necessários
    employee = Employee.create(
      name: 'João',
      role: 'Desenvolvedor',
      department: 'Tecnologia',
      admission_date: DateTime.now,
      company: 'Empresa de Desenvolvimento'
      )

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('td', text: employee.name)
    expect(page).to have_css('td', text: employee.role)
    expect(page).to have_css('td', text: employee.department)
  end

  scenario 'and view employees list' do
    #cria os dados necessários
    employee = Employee.create(
      name: 'João',
      role: 'Desenvolvedor',
      department: 'Tecnologia',
      admission_date: DateTime.now,
      company: 'Empresa de Desenvolvimento'
      )

    another_employee = Employee.create(
      name: 'Rafael',
      role: 'Analista Financeiro',
      department: 'Financeiro',
      admission_date: DateTime.now,
      company: 'Empresa de Desenvolvimento'
      )

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('td', text: employee.name)
    expect(page).to have_css('td', text: employee.role)
    expect(page).to have_css('td', text: employee.department)

    expect(page).to have_css('td', text: another_employee.name)
    expect(page).to have_css('td', text: another_employee.role)
    expect(page).to have_css('td', text: another_employee.department)
  end
end
