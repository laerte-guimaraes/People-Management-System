require 'rails_helper'

feature 'Admin register department' do
  scenario 'successfully' do
    visit root_path
    click_on 'Register Departments'
    fill_in 'Name', with: 'Tecnologia'
    click_on 'Create'

    expect(page).to have_css('h2', text: 'Department Information')
    expect(page).to have_css('div.department-name', text: 'Tecnologia')
  end

  scenario 'and must fill in name' do
    visit new_department_path
    click_on 'Create'

    expect(page).to have_content('You need to fill in the fields !')
  end
end