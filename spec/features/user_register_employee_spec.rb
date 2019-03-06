require 'rails_helper'

def employee
    {
        name: 'José da Silva',
        company: 'Empresa de Testes',
        summary: 'Atua diretamente com a equipe de desenvolvimento de software',
        role: 'Desenvolvedor',
        department: 'Tecnologia',
        admission_date: '01/02/2019',
        description: 'Simpático, Extrovertido, Disposto a aprender novas tecnologias'
    }
end

feature 'User register employee' do
  scenario 'successfully' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco

    # simula a ação do usuário
    visit root_path
    click_on 'Add Employee'
    fill_in 'Name', with: employee[:name]
    fill_in 'Summary', with: employee[:summary]
    fill_in 'Admission Date', with: employee[:admission_date]
    fill_in 'Role', with: employee[:role]
    fill_in 'Department', with: employee[:department]
    fill_in 'Company', with: employee[:company]
    fill_in 'Description', with: employee[:description]
    click_on 'Create'

    # expectativas
    expect(page).to have_css('h2', text: 'Employee Information')
    expect(page).to have_css('div.employee-name', text: employee[:name])
    expect(page).to have_css('div.employee-company', text: employee[:company])
    expect(page).to have_css('div.employee-summary', text: employee[:summary])
    expect(page).to have_css('div.employee-role', text: employee[:role])
    expect(page).to have_css('div.employee-department', text: employee[:department])
    expect(page).to have_css('div.employee-admission', text: employee[:admission_date])
    expect(page).to have_css('div.employee-description', text: employee[:description])
  end
end