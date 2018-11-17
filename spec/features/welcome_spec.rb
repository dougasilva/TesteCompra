require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show Welcome message' do
    visit(root_path)
    expect(page).to have_content('Bem Vindo')
  end

  scenario 'Check Product Registration Link' do
    visit(root_path)
    expect(find('ul li')).to have_link('Cadastro de Produtos')
  end
end
